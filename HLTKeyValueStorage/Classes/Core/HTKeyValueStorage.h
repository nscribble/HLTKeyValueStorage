//
//  HTKeyValueStorage.h
//  Kernel
//
//  Created by Jason on 2018/12/21.
//  Copyright © 2018年 Jason. All rights reserved.
//  本地缓存（替代NSUserDefault）

#import <Foundation/Foundation.h>

@interface HTKeyValueStorage : NSObject

+ (void)ht_setObject:(nullable id)value forKey:(nonnull NSString *)key;
+ (void)ht_setData:(NSData *)value forKey:(NSString *)key;
+ (void)ht_setBool:(BOOL)value forKey:(nonnull NSString *)key;
+ (void)ht_setFloat:(float)value forKey:(nonnull NSString *)key;
+ (void)ht_setDouble:(double)value forKey:(nonnull NSString *)key;
+ (void)ht_setInteger:(NSInteger)value forKey:(nonnull NSString *)key;

+ (nullable NSString *)ht_stringForKey:(nonnull NSString *)key;
+ (nullable NSArray *)ht_arrayForKey:(nonnull NSString *)key;
+ (nullable NSDictionary *)ht_dictionaryForKey:(nonnull NSString *)key;
+ (nullable NSData *)ht_dataForKey:(nonnull NSString *)key;
+ (nullable NSDate *)ht_dateForKey:(nonnull NSString *)key;
+ (nullable NSNumber *)ht_numberForKey:(nonnull NSString *)key;

+ (BOOL)ht_boolForKey:(nonnull NSString *)key;
+ (float)ht_floatForKey:(nonnull NSString *)key;
+ (double)ht_doubleForKey:(nonnull NSString *)key;
+ (NSInteger)ht_integerForKey:(nonnull NSString *)key;

+ (void)ht_removeObjectForKey:(nonnull NSString *)key;
+ (void)ht_removeObjectsForKeys:(nonnull NSArray *)arrkeys;

///清理已迁移到MMKV, 但userDefault中未删除的脏数据
+ (void)ht_clearUserDefaultData;

@end

#pragma mark - HTUserStorage

@interface HTUserStorage : HTKeyValueStorage

@end

#pragma mark - HTGlobalStorage

@interface HTGlobalStorage : HTKeyValueStorage

+ (void)ht_saveUserIdentifier:(nonnull NSString *)identifier;

@end
