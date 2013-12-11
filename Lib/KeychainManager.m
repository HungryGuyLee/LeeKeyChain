//
//  KeychainManager.m
//  
//
//  Created by Lee on 11/18/13.
//  Copyright (c) 2013 Lee. All rights reserved.
//

#import "KeychainManager.h"
#import <Security/Security.h>
@implementation KeychainManager
+(NSMutableDictionary *)KeychainQueryDictionaryWithService:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass,service,(__bridge id)kSecAttrService, nil];
}

+(void)saveObject:(id)data withService:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self KeychainQueryDictionaryWithService:service];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

+(id)loadObjectWithService:(NSString *)service
{
    id result = nil;
    NSMutableDictionary *keychainQuery = [self KeychainQueryDictionaryWithService:service];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    CFDataRef keyData = NULL;
    if(SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr )
    {
        result = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
    }
    if(keyData)
    {
        CFRelease(keyData);
    }
    return result;

}

+(void)removeWithService:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self KeychainQueryDictionaryWithService:service];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}

@end
