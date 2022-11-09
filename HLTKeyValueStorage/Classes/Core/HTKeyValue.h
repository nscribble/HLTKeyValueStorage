//
//  HTKeyValue.h
//  Kernel
//
//  Created by Jason on 2018/9/29.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTKeyValue : NSObject

+ (BOOL)setObject:(id)obj forKey:(NSString *)key;
+ (BOOL)setObject:(id)obj forKey:(NSString *)key userID:(NSString *)userID;

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key userID:(NSString *)userID;

+ (BOOL)setBool:(BOOL)value forKey:(NSString *)key;
+ (BOOL)setBool:(BOOL)value forKey:(NSString *)key userID:(NSString *)userID;

+ (BOOL)setInteger:(NSInteger)value forKey:(NSString *)key;
+ (BOOL)setInteger:(NSInteger)value forKey:(NSString *)key userID:(NSString *)userID;

+ (BOOL)setFloat:(float)value forKey:(NSString *)key;
+ (BOOL)setFloat:(float)value forKey:(NSString *)key userID:(NSString *)userID;

+ (BOOL)setDouble:(double)value forKey:(NSString *)key;
+ (BOOL)setDouble:(double)value forKey:(NSString *)key userID:(NSString *)userID;

+ (id)getObjectOfClass:(Class)cls forKey:(NSString *)key;
+ (id)getObjectOfClass:(Class)cls forKey:(NSString *)key userID:(NSString *)userID;

+ (NSString *)getStringForKey:(NSString *)key;
+ (NSString *)getStringForKey:(NSString *)key userID:(NSString *)userID;

+ (NSArray *)getArrayForKey:(NSString *)key;
+ (NSArray *)getArrayForKey:(NSString *)key userID:(NSString *)userID;

+ (NSDictionary *)getDictionaryForKey:(NSString *)key;
+ (NSDictionary *)getDictionaryForKey:(NSString *)key userID:(NSString *)userID;

+ (NSData *)getDataForKey:(NSString *)key;
+ (NSData *)getDataForKey:(NSString *)key userID:(NSString *)userID;

+ (NSDate *)getDateForKey:(NSString *)key;
+ (NSDate *)getDateForKey:(NSString *)key userID:(NSString *)userID;

+ (NSNumber *)getNumberForKey:(NSString *)key;
+ (NSNumber *)getNumberForKey:(NSString *)key userID:(NSString *)userID;

+ (NSValue *)getValueForKey:(NSString *)key;
+ (NSValue *)getValueForKey:(NSString *)key userID:(NSString *)userID;

+ (bool)getBoolForKey:(NSString *)key;
+ (bool)getBoolForKey:(NSString *)key userID:(NSString *)userID;

+ (NSInteger)getIntegerForKey:(NSString *)key;
+ (NSInteger)getIntegerForKey:(NSString *)key userID:(NSString *)userID;

+ (float)getFloatForKey:(NSString *)key;
+ (float)getFloatForKey:(NSString *)key userID:(NSString *)userID;

+ (double)getDoubleForKey:(NSString *)key;
+ (double)getDoubleForKey:(NSString *)key userID:(NSString *)userID;

+ (void)removeObjectForKey:(NSString *)key;
+ (void)removeObjectForKey:(NSString *)key userID:(NSString *)userID;

+ (void)removeObjectsForKeys:(NSArray *)arrKeys;
+ (void)removeObjectsForKeys:(NSArray *)arrKeys userID:(NSString *)userID;

+ (void)clearMemoryCache;

+ (void)clearAll;

+ (BOOL)containsKey:(NSString *)key;
+ (BOOL)containsKey:(NSString *)key userID:(NSString *)userID;

+ (void)setLogEnable:(BOOL)enable;

@end
