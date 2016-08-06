//
//  DES.m
//  RYTong
//
//  Created by Zheng Bing on 5/4/09.
//  Copyright 2009 RYTong. All rights reserved.
//

#import "DES.h"
#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Foundation/Foundation.h>
//#import <Utility/Base64.h>
#import "Base64.h"

#define kChosenCipherBlockSize	kCCBlockSizeDES
#define kChosenCipherKeySize	kCCKeySizeDES

@implementation DES


+ (NSData *) doEncryptWithData:(NSData *)plainData key:(NSData *)key {
    
    CCOptions pad = kCCOptionECBMode | kCCOptionPKCS7Padding;
    NSData *data = [DES doCipher:plainData key:key context:kCCEncrypt padding:&pad];
    
    NSData *base64Data = [Base64 encodeData:data];
    return base64Data;
    
}

+ (NSData *) doEncryptWithString:(NSString *)plainText key:(NSString *)key {
    
    NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    return [DES doEncryptWithData:plainData key:keyData];
    
}

+ (NSData *) doEncryptWithStringAndData:(NSString *)plainText key:(NSData *)key {
    
    NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    return [DES doEncryptWithData:plainData key:key];
    
}

+ (NSData *) doDecryptWithStringAndData:(NSString *)cipherText key:(NSData *)key {
    
    NSData *cipherData = [cipherText dataUsingEncoding:NSUTF8StringEncoding];
    return [DES doDecryptWithData:cipherData key:key];
    
}


+ (NSData *) doDecryptWithData:(NSData *)cipherData key:(NSData *)key {
    
    //CCOptions pad = kCCOptionECBMode | kCCOptionPKCS7Padding;
    CCOptions pad = kCCOptionECBMode;
    //NSData * base64Data = [[NSData alloc]initWithBase64EncodedData:cipherData options:0];
    NSData *base64Data = [Base64 decodeData:cipherData];
    NSData *data = [DES doCipher:base64Data key:key context:kCCDecrypt padding:&pad];
    return data;
    
}

+ (NSData *) doDecryptWithString:(NSString *)cipherText key:(NSString *)key {
    
    NSData *cipherData = [cipherText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    return [DES doDecryptWithData:cipherData key:keyData];
    
}

+ (NSData *) doCipher:(NSData *)plainText key:(NSData *)symmetricKey context:(CCOperation)encryptOrDecrypt padding:(CCOptions *)pkcs7 {
    
    
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
    
    // Initialization vector; dummy in this case 0's.
    uint8_t iv[kChosenCipherBlockSize];
    memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    
    if (plainText == nil) {
        return nil;
    }
    
    if (symmetricKey == nil) {
        return nil;
    }
    
    if (pkcs7 == NULL) {
        return nil;
    }
    
    if ([symmetricKey length] != kChosenCipherKeySize) {
        return nil;
    }
    
    plainTextBufferSize = [plainText length];
    
    if (plainTextBufferSize <= 0) {
        return nil;
    }
    
    // We don't want to toss padding on if we don't need to
    //if(encryptOrDecrypt == kCCEncrypt) {
//        if(*pkcs7 != kCCOptionECBMode) {
//            if((plainTextBufferSize % kChosenCipherBlockSize) == 0) {
//                *pkcs7 = 0x0000;
//            } else {
//                *pkcs7 = kCCOptionPKCS7Padding;
//            }
//        }
//    } else if(encryptOrDecrypt != kCCDecrypt) {
//        //LOGGING_FACILITY1( 0, @"Invalid CCOperation parameter [%d] for cipher context.", *pkcs7 );
//    } 
    
    
    
    // Create and Initialize the crypto reference.
    ccStatus = CCCryptorCreate(	encryptOrDecrypt, 
                               kCCAlgorithmDES, 
                               *pkcs7, 
                               (const void *)[symmetricKey bytes], 
                               kChosenCipherKeySize, 
                               (const void *)iv, 
                               &thisEncipher
                               );
    
    
    if (ccStatus != kCCSuccess) {
        return nil;
    }
    
    // Calculate byte block alignment for all calls through to and including final.
    bufferPtrSize = CCCryptorGetOutputLength(thisEncipher, plainTextBufferSize, true);
    
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
    
    
    if (ccStatus != kCCSuccess) {
        if(bufferPtr) free(bufferPtr);
        return nil;
    }
    
    // Handle book keeping.
    ptr += movedBytes;
    remainingBytes -= movedBytes;
    totalBytesWritten += movedBytes;
    
    // Finalize everything to the output buffer.
    ccStatus = CCCryptorFinal(thisEncipher,
                              ptr,
                              remainingBytes,
                              &movedBytes
                              );
    
    
    
    totalBytesWritten += movedBytes;
    
    if(thisEncipher) {
        (void) CCCryptorRelease(thisEncipher);
        thisEncipher = NULL;
    }
    
    
    if (ccStatus != kCCSuccess) {
        if(bufferPtr) free(bufferPtr);
        return nil;
    }
    
    cipherOrPlainText = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)totalBytesWritten];
    
    if(bufferPtr) free(bufferPtr);
    
    return cipherOrPlainText;
    
}


@end