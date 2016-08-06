//
//  DES.h
//  RYTong
//
//  Created by Zheng Bing on 5/4/09.
//  Copyright 2009 RYTong. All rights reserved.
//

#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

/** DES 加解密
 */

@interface DES : NSObject 


/** DES 加密
 
 @param plainText 待加密的字符串
 @param key NSData 类型的加密密钥
 @return 返回加密后的二进制数据
 */
+ (NSData *) doEncryptWithStringAndData:(NSString *)plainText key:(NSData *)key;

/** DES 解密
 
 @param plainText 待解密的字符串
 @param key NSData 类型的解密密钥
 @return 返回解密后的二进制数据
 */
+ (NSData *) doDecryptWithStringAndData:(NSString *)cipherText key:(NSData *)key;

/** DES 加密
 
 @param plainText 待加密的二进制数据
 @param key NSData 类型的加密密钥
 @return 返回加密后的二进制数据
 */
+ (NSData *) doEncryptWithData:(NSData *)plainData key:(NSData *)key;

/** DES 加密
 
 @param plainText 待加密字符串
 @param key NSString 类型的加密密钥
 @return 返回加密后的二进制数据
 */
+ (NSData *) doEncryptWithString:(NSString *)plainData key:(NSString *)key;

/** DES 解密
 
 @param plainText 待解密的二进制数据
 @param key NSData 类型的解密密钥
 @return 返回解密后的二进制数据
 */
+ (NSData *) doDecryptWithData:(NSData *)cipherData key:(NSData *)key;

/** DES 解密
 
 @param plainText 待解密的字符串
 @param key NSString 类型的解密密钥
 @return 返回解密后的二进制数据
 */
+ (NSData *) doDecryptWithString:(NSString *)cipherString key:(NSString *)key;

+ (NSData *) doCipher:(NSData *)plainText key:(NSData *)symmetricKey context:(CCOperation)encryptOrDecrypt padding:(CCOptions *)pkcs7;


@end
