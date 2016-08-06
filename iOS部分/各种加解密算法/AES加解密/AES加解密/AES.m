//
//  AES.m
//  GDB
//
//  Created by Wu Dong on 11/23/10.
//  Copyright 2010 xx. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonHMAC.h>
#import "AES.h"


@implementation AES

+ (NSData *)doAESEncrypt:(NSData *)plainText Key:(NSData *)sKey IV:(NSData *)sIv isEncrypt:(CCOperation)encryptOrDecrypt {
	CCCryptorStatus ccStatus = kCCSuccess;
	// Symmetric crypto reference.
	CCCryptorRef thisEncipher = NULL;
	// Cipher Text container.
	NSData * cipherOrPlainText = nil;
	// Pointer to output buffer.
	uint8_t * bufferPtr = NULL;
	// Total size of the buffer.
	size_t bufferPtrSize = 0;
	// Remaining bytes to be performed on.
	size_t remainingBytes = 0;
	// Number of bytes moved to buffer.
	size_t movedBytes = 0;
	// Length of plainText buffer.
	size_t plainTextBufferSize = 0;
	// Placeholder for total written.
	size_t totalBytesWritten = 0;
	// A friendly helper pointer.
	uint8_t * ptr;
    
	plainTextBufferSize = [plainText length];
	
	// We don't want to toss padding on if we don't need to
	CCOptions pkcs7;
	if(encryptOrDecrypt == kCCEncrypt) {
		if(pkcs7 != kCCOptionECBMode) {
			//if((plainTextBufferSize % kCCBlockSizeAES128) == 0) {
//				pkcs7 = 0x0000;
//			} else {
//				pkcs7 = kCCOptionPKCS7Padding;
//			}
            pkcs7 = kCCOptionPKCS7Padding;
		}
	} else if(encryptOrDecrypt == kCCDecrypt) {
		pkcs7 = kCCOptionPKCS7Padding;
	}
	
	// Create and Initialize the crypto reference.
	ccStatus = CCCryptorCreate(	encryptOrDecrypt, 
                               kCCAlgorithmAES128, 
                               pkcs7, 
                               (const void *)[sKey bytes], 
                               kCCKeySizeAES256, 
                               (const void *)[sIv bytes], 
                               &thisEncipher
                               );
	
	
	
	// Calculate byte block alignment for all calls through to and including final.
	bufferPtrSize = CCCryptorGetOutputLength(thisEncipher, plainTextBufferSize, true);
    //Fixes #6444
    //使用kCCBlockSizeAES128时在aes256时可能会出错。bufferPtrSize分配大一些是不会导致问题的，因此请使用下面代码：
    bufferPtrSize = (bufferPtrSize > (kCCKeySizeAES256 + plainTextBufferSize)) ? bufferPtrSize : (kCCKeySizeAES256 + plainTextBufferSize);
	
	// Allocate buffer.
	bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t) );
	
	// Zero out buffer.
	memset((void *)bufferPtr, 0x0, bufferPtrSize);
	
	// Initialize some necessary book keeping.
	
	ptr = bufferPtr;
	
	// Set up initial size.
	remainingBytes = bufferPtrSize;
	
	// Actually perform the encryption or decryption.
	ccStatus = CCCryptorUpdate( thisEncipher,
                               (const void *) [plainText bytes],
                               plainTextBufferSize,
                               ptr,
                               remainingBytes,
                               &movedBytes
                               );
	
	// Handle book keeping.
	ptr += movedBytes;
	remainingBytes -= movedBytes;
	totalBytesWritten += movedBytes;
	
	// Finalize everything to the output buffer.
	ccStatus = CCCryptorFinal(	thisEncipher,
                              ptr,
                              remainingBytes,
                              &movedBytes
                              );
	
	totalBytesWritten += movedBytes;
	
	if(thisEncipher) {
		(void) CCCryptorRelease(thisEncipher);
		thisEncipher = NULL;
	}
	
	cipherOrPlainText = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)totalBytesWritten];
    
	if(bufferPtr) {
		free(bufferPtr);
	}

	return cipherOrPlainText;
}


@end


@implementation NSData (AESAdditions)
- (NSData*)AES256EncryptWithKey:(NSData *)key iv:(NSData *)iv {
    
    /*
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256 + 1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    */
     
     
    NSUInteger dataLength = [self length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize           = dataLength + kCCBlockSizeAES128;
    void* buffer                = malloc(bufferSize);
    
    size_t numBytesEncrypted    = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                           (const void *) [key bytes], kCCKeySizeAES256,
                                           (const void *) [iv bytes] /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess)
    {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        NSData *data = [NSData dataWithBytes:buffer length:numBytesEncrypted];
        free(buffer); //free the buffer;

        return data;
    }
    
    free(buffer); //free the buffer;
    return nil;
}

- (NSData*)AES256DecryptWithKey:(NSData *)key iv:(NSData *)iv {
/*
 // 'key' should be 32 bytes for AES256, will be null-padded otherwise
 char keyPtr[kCCKeySizeAES256 + 1]; // room for terminator (unused)
 bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
 
 // fetch key data
 [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
 */

    
    NSUInteger dataLength = [self length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize           = dataLength + kCCBlockSizeAES128;
    void* buffer                = malloc(bufferSize);
    
    size_t numBytesDecrypted    = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          (const void *)[key bytes], kCCKeySizeAES256,
                                          (const void *) [iv bytes] /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess)
    {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        NSData *data = [NSData dataWithBytes:buffer length:numBytesDecrypted];
        free(buffer); //free the buffer;

        return data;
    }
    
    free(buffer); //free the buffer;
    return nil;
}
@end
