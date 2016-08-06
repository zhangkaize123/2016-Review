//
//  AES.h
//  APP
//
//  Created by Wu Dong on 11/23/10.
//  Copyright 2010 xx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

/// AES 加解密
@interface AES : NSObject

/** AES 加解密
 
 @param plainText 需要加解密的二进制数据
 @param sKey raw key material 
 @param iv 初始矢量
 @param encryptOrDecrypt 加密或解密
 @return 返回加密或解密后的二进制数据
 */
+ (NSData *)doAESEncrypt:(NSData *)plainText Key:(NSData *)sKey IV:(NSData *)sIv isEncrypt:(CCOperation)encryptOrDecrypt;

@end

/// NSData 方法扩展
@interface NSData (AESAdditions)

/** AES256 加密 
 
 @param key raw key material
 @param iv 初始矢量
 @return 返回加密后的二进制数据
 */
- (NSData*)AES256EncryptWithKey:(NSData*)key iv:(NSData*)iv;

/** AES256 解密
 
 @param key raw key material
 @param iv 初始矢量
 @return 返回解密后的二进制数据
 */
- (NSData*)AES256DecryptWithKey:(NSData *)key iv:(NSData *)iv;
@end
