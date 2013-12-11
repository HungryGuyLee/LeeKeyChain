//
//  KeychainManager.h
//  
//
//  Created by Lee on 11/18/13.
//  Copyright (c) 2013 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainManager : NSObject
+(NSMutableDictionary *)KeychainQueryDictionaryWithService:(NSString *)service;
+(void)saveObject:(id)data withService:(NSString *)service;
+(id)loadObjectWithService:(NSString *)service;
+(void)removeWithService:(NSString *)service;
@end
