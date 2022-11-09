//
//  HTKeyValue.m
//  Kernel
//
//  Created by Jason on 2018/9/29.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "HTKeyValue.h"
#import "MMKV.h"

@implementation HTKeyValue

+ (BOOL)setObject:(id)obj forKey:(NSString *)key {
    return [self setObject:obj forKey:key userID:nil];
}

+ (BOOL)setObject:(id)obj forKey:(NSString *)key userID:(NSString *)userID {
    if ([obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSArray class]]) {
        obj = [self transformedToStringFor:obj];
    }
    return [[self mmkvWithID:userID] setObject:obj forKey:key];
}

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key {
    return [self setData:data forKey:key userID:nil];
}

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key userID:(NSString *)userID {
    NSAssert([data isKindOfClass:[NSData class]], @" error ");
    return [[self mmkvWithID:userID] setData:data forKey:key];
}

+ (BOOL)setBool:(BOOL)value forKey:(NSString *)key {
    return [self setBool:value forKey:key userID:nil];
}

+ (BOOL)setBool:(BOOL)value forKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] setBool:value forKey:key];
}

+ (BOOL)setInteger:(NSInteger)value forKey:(NSString *)key {
    return [self setInteger:value forKey:key userID:nil];
}

+ (BOOL)setInteger:(NSInteger)value forKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] setInt64:value forKey:key];
}

+ (BOOL)setFloat:(float)value forKey:(NSString *)key {
    return [self setFloat:value forKey:key userID:nil];
}

+ (BOOL)setFloat:(float)value forKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] setFloat:value forKey:key];
}

+ (BOOL)setDouble:(double)value forKey:(NSString *)key {
    return [self setDouble:value forKey:key userID:nil];
}

+ (BOOL)setDouble:(double)value forKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] setDouble:value forKey:key];
}

+ (id)getObjectOfClass:(Class)cls forKey:(NSString *)key {
    return [self getObjectOfClass:cls forKey:key userID:nil];
}

+ (id)getObjectOfClass:(Class)cls forKey:(NSString *)key userID:(NSString *)userID {
    if ([cls isEqual:NSArray.class] || [cls isEqual:NSDictionary.class]) {
        cls = NSString.class;
    }
    id obj = [[self mmkvWithID:userID] getObjectOfClass:cls forKey:key];
    return [self transformedToJSONObjectFrom:obj];
}

+ (NSString *)getStringForKey:(NSString *)key {
    return [self getStringForKey:key userID:nil];
}
+ (NSString *)getStringForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getObjectOfClass:NSString.class forKey:key];
}

+ (NSArray *)getArrayForKey:(NSString *)key {
    return [self getArrayForKey:key userID:nil];
}
+ (NSArray *)getArrayForKey:(NSString *)key userID:(NSString *)userID {
    return [self getObjectOfClass:NSArray.class forKey:key userID:userID];
}

+ (NSDictionary *)getDictionaryForKey:(NSString *)key {
    return [self getDictionaryForKey:key userID:nil];
}
+ (NSDictionary *)getDictionaryForKey:(NSString *)key userID:(NSString *)userID {
    return [self getObjectOfClass:NSDictionary.class forKey:key userID:userID];
}

+ (NSData *)getDataForKey:(NSString *)key {
    return [self getDataForKey:key userID:nil];
}
+ (NSData *)getDataForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getObjectOfClass:NSData.class forKey:key];
}

+ (NSDate *)getDateForKey:(NSString *)key {
    return [self getDateForKey:key userID:nil];
}
+ (NSDate *)getDateForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getObjectOfClass:NSDate.class forKey:key];
}

+ (NSNumber *)getNumberForKey:(NSString *)key {
    return [self getNumberForKey:key userID:nil];
}

+ (NSNumber *)getNumberForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getObjectOfClass:NSNumber.class forKey:key];
}

+ (NSValue *)getValueForKey:(NSString *)key {
    return [self getValueForKey:key userID:nil];
}

+ (NSValue *)getValueForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getObjectOfClass:NSValue.class forKey:key];
}

+ (bool)getBoolForKey:(NSString *)key {
    return [self getBoolForKey:key userID:nil];
}

+ (bool)getBoolForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getBoolForKey:key];
}

+ (NSInteger)getIntegerForKey:(NSString *)key {
    return [self getIntegerForKey:key userID:nil];
}

+ (NSInteger)getIntegerForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getInt64ForKey:key];
}

+ (float)getFloatForKey:(NSString *)key {
    return [self getFloatForKey:key userID:nil];
}

+ (float)getFloatForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getFloatForKey:key];
}

+ (double)getDoubleForKey:(NSString *)key {
    return [self getDoubleForKey:key userID:nil];
}

+ (double)getDoubleForKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] getDoubleForKey:key];
}

+ (void)removeObjectForKey:(NSString *)key {
    [self removeObjectForKey:key userID:nil];
}

+ (void)removeObjectForKey:(NSString *)key userID:(NSString *)userID {
    [[self mmkvWithID:userID] removeValueForKey:key];
}

+ (void)removeObjectsForKeys:(NSArray *)arrKeys {
    [self removeObjectsForKeys:arrKeys];
}

+ (void)removeObjectsForKeys:(NSArray *)arrKeys userID:(NSString *)userID {
    [[self mmkvWithID:userID] removeValuesForKeys:arrKeys];
}

+ (void)clearMemoryCache {
    MMKV *kv = [MMKV defaultMMKV];
    [kv clearMemoryCache];
}

+ (void)clearAll {
    MMKV *kv = [MMKV defaultMMKV];
    [kv clearAll];
}

+ (BOOL)containsKey:(NSString *)key {
    return [self containsKey:key userID:nil];
}

+ (BOOL)containsKey:(NSString *)key userID:(NSString *)userID {
    return [[self mmkvWithID:userID] containsKey:key];
}

#pragma mark - private
+ (MMKV *)mmkvWithID:(NSString *)userID {
    return (userID && userID.length > 0) ? [MMKV mmkvWithID:userID] : [MMKV defaultMMKV];
}

+ (void)setLogEnable:(BOOL)enable {
    if (!enable) {
        [MMKV setLogLevel:MMKVLogNone];
    } else {
        [MMKV setLogLevel:MMKVLogInfo];
    }
}

#pragma mark - transformer

+ (NSString *)transformedToStringFor:(id)value {
    if (!value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    if ([value isKindOfClass:[NSDictionary class]] ||
        [value isKindOfClass:[NSArray class]]) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:value options:NSJSONWritingPrettyPrinted error:&error];
        if (!error && data) {
            NSString *JSONString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            return JSONString;
        }
        else {
            NSLog(@"transformedValue error: %@", error);
        }
    }
    
    NSAssert(NO, @"%@ is not valid NSString", value);
    
    return value;
}

+ (id)transformedToJSONObjectFrom:(id)value {
    if (!value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSDictionary class]] ||
        [value isKindOfClass:[NSArray class]]) {
        return value;
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([(NSString *)value length] == 0) {
            return nil;
        }
        NSData *dataInUTF8 = [(NSString *)value dataUsingEncoding:NSUTF8StringEncoding];
        
        if (dataInUTF8) {
            NSError *error;
            id object = [NSJSONSerialization JSONObjectWithData:dataInUTF8 options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:&error];
            if (!error) {
                return object;
            }
        }
    } else if ([value isKindOfClass:[NSData class]]) {
        NSError *error;
        id object = [NSJSONSerialization JSONObjectWithData:value options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:&error];
        if (!error) {
            return object;
        }
    }
    
    NSAssert(NO, @"%@ is not valid JSON String", value);
    
    return value;
}

@end
