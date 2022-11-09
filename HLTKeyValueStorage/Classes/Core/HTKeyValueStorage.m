//
//  HTKeyValueStorage.m
//  Kernel
//
//  Created by Jason on 2018/12/21.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "HTKeyValueStorage.h"
#import "HTKeyValue.h"
#import <objc/runtime.h>

static NSString * const kMMKVUserIdentifier = @"MMKVUserIdentifier";

#pragma mark - HTKeyValueStorage

@implementation HTKeyValueStorage

+ (void)ht_setObject:(nullable id)value forKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }

    [HTKeyValue setObject:value forKey:key userID:[self loginUserUid]];
}

+ (void)ht_setData:(NSData *)value forKey:(NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }
    
    [HTKeyValue setData:value forKey:key userID:[self loginUserUid]];
}

+ (void)ht_setBool:(BOOL)value forKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }
    [HTKeyValue setBool:value forKey:key userID:[self loginUserUid]];
}

+ (void)ht_setFloat:(float)value forKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }
    [HTKeyValue setFloat:value forKey:key userID:[self loginUserUid]];
}

+ (void)ht_setDouble:(double)value forKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }
    [HTKeyValue setDouble:value forKey:key userID:[self loginUserUid]];
}

+ (void)ht_setInteger:(NSInteger)value forKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }
    [HTKeyValue setInteger:value forKey:key userID:[self loginUserUid]];
}

+ (nullable NSString *)ht_stringForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return nil;
    }
    
    //! 请注意：这里会导致递归了！
    id value = [HTKeyValue getStringForKey:key userID:[self loginUserUid]];
    if (value) {
        return [value isKindOfClass:NSString.class] ? value : nil;
    } else {
        value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (!value || ![value isKindOfClass:NSString.class]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            return nil;
        }
        [self ht_setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (nullable NSArray *)ht_arrayForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return nil;
    }
    
    id value = [HTKeyValue getArrayForKey:key userID:[self loginUserUid]];
    if (value) {
        return [value isKindOfClass:NSArray.class] ? value : nil;
    } else {
        value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (!value || ![value isKindOfClass:NSArray.class]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            return nil;
        }
        [self ht_setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (nullable NSDictionary *)ht_dictionaryForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return nil;
    }
    
    id value = [HTKeyValue getDictionaryForKey:key userID:[self loginUserUid]];
    if (value) {
        return [value isKindOfClass:NSDictionary.class] ? value : nil;
    } else {
        value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (!value || ![value isKindOfClass:NSDictionary.class]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            return nil;
        }
        [self ht_setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (nullable NSData *)ht_dataForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return nil;
    }
    
    id value = [HTKeyValue getDataForKey:key userID:[self loginUserUid]];
    if (value) {
        return [value isKindOfClass:NSData.class] ? value : nil;
    } else {
        value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (!value || ![value isKindOfClass:NSData.class]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            return nil;
        }
        [self ht_setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (nullable NSDate *)ht_dateForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return nil;
    }
    
    id value = [HTKeyValue getDateForKey:key userID:[self loginUserUid]];
    if (value) {
        return [value isKindOfClass:NSDate.class] ? value : nil;
    } else {
        value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (!value || ![value isKindOfClass:NSDate.class]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            return nil;
        }
        [self ht_setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (nullable NSNumber *)ht_numberForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return nil;
    }
    
    id value = [HTKeyValue getNumberForKey:key userID:[self loginUserUid]];
    if (value) {
        return [value isKindOfClass:NSNumber.class] ? value : nil;
    } else {
        value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (!value || ![value isKindOfClass:NSNumber.class]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            return nil;
        }
        [self ht_setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (BOOL)ht_boolForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return NO;
    }
    
    if ([self containsKey:key]) {
        return [HTKeyValue getBoolForKey:key userID:[self loginUserUid]];
    } else {
        BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:key];
        [self ht_setBool:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (float)ht_floatForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return 0;
    }
    
    if ([self containsKey:key]) {
        return [HTKeyValue getFloatForKey:key userID:[self loginUserUid]];
    } else {
        float value = [[NSUserDefaults standardUserDefaults] floatForKey:key];
        [self ht_setFloat:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (double)ht_doubleForKey:(NSString *)key {
    if (![self checkKeySanity:key]) {
        return 0;
    }
    
    if ([self containsKey:key]) {
        return [HTKeyValue getDoubleForKey:key userID:[self loginUserUid]];
    } else {
        double value = [[NSUserDefaults standardUserDefaults] doubleForKey:key];
        [self ht_setDouble:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (NSInteger)ht_integerForKey:(NSString *)key {
    if (![self checkKeySanity:key]) {
        return 0;
    }
    
    if ([self containsKey:key]) {
        return [HTKeyValue getIntegerForKey:key userID:[self loginUserUid]];
    } else {
        NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:key];
        [self ht_setInteger:value forKey:key];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        return value;
    }
}

+ (void)ht_removeObjectForKey:(nonnull NSString *)key {
    if (![self checkKeySanity:key]) {
        return;
    }
    
    if ([self containsKey:key]) {
        [HTKeyValue removeObjectForKey:key userID:[self loginUserUid]];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}

+ (void)ht_removeObjectsForKeys:(nonnull NSArray *)arrKeys {
    if (!arrKeys || arrKeys.count == 0) {
        NSAssert(NO, @"传入的key数组为空");
        return;
    }
    [HTKeyValue removeObjectsForKeys:arrKeys userID:[self loginUserUid]];
}

+ (void)ht_clearUserDefaultData {
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:appDomain];
    [[dict allKeys] enumerateObjectsUsingBlock:^(NSString *  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL containsKey = [HTKeyValue containsKey:key userID:[self loginUserUid]] ||
                           [HTKeyValue containsKey:key userID:nil];
        if (containsKey) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        }
    }];
}

#pragma mark - private
+ (BOOL)checkKeySanity:(nonnull NSString *)key {
    if (!key || key.length == 0) {
        NSAssert(NO, @"传入的key为空值");
        return NO;
    }
    return YES;
}

+ (BOOL)containsKey:(NSString *)key {
    return [HTKeyValue containsKey:key userID:[self loginUserUid]];
}

+ (NSString *)loginUserUid {
    return nil;
}

@end

#pragma mark -

@implementation HTUserStorage

+ (NSString *)loginUserUid {
    NSString *userIdentifier = nil;
    if ([self isMemberOfClass:object_getClass([HTUserStorage class])]) {
        userIdentifier = [HTGlobalStorage ht_stringForKey:kMMKVUserIdentifier];
    }
#if TARGET_IPHONE_SIMULATOR
//    NSAssert(userIdentifier != nil, @"HTUserStorage userId == nil!");
#endif

    return userIdentifier;
}

@end

#pragma mark - HTGlobalStorage

@implementation HTGlobalStorage

+ (NSString *)loginUserUid {
    return nil;// @"global";
}

+ (void)ht_saveUserIdentifier:(nonnull NSString *)identifier {
    [self ht_setObject:identifier forKey:kMMKVUserIdentifier];
}

@end
