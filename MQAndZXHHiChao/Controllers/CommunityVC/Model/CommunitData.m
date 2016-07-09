//
//  CommunitData.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitData.h"
#import "CommunitItems.h"


NSString *const kCommunitDataFlag = @"flag";
NSString *const kCommunitDataItems = @"items";
NSString *const kCommunitDataAppApi = @"appApi";


@interface CommunitData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitData

@synthesize flag = _flag;
@synthesize items = _items;
@synthesize appApi = _appApi;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.flag = [self objectOrNilForKey:kCommunitDataFlag fromDictionary:dict];
    NSObject *receivedCommunitItems = [dict objectForKey:kCommunitDataItems];
    NSMutableArray *parsedCommunitItems = [NSMutableArray array];
    if ([receivedCommunitItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCommunitItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCommunitItems addObject:[CommunitItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCommunitItems isKindOfClass:[NSDictionary class]]) {
       [parsedCommunitItems addObject:[CommunitItems modelObjectWithDictionary:(NSDictionary *)receivedCommunitItems]];
    }

    self.items = [NSArray arrayWithArray:parsedCommunitItems];
            self.appApi = [self objectOrNilForKey:kCommunitDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flag forKey:kCommunitDataFlag];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kCommunitDataItems];
    [mutableDict setValue:self.appApi forKey:kCommunitDataAppApi];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.flag = [aDecoder decodeObjectForKey:kCommunitDataFlag];
    self.items = [aDecoder decodeObjectForKey:kCommunitDataItems];
    self.appApi = [aDecoder decodeObjectForKey:kCommunitDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flag forKey:kCommunitDataFlag];
    [aCoder encodeObject:_items forKey:kCommunitDataItems];
    [aCoder encodeObject:_appApi forKey:kCommunitDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitData *copy = [[CommunitData alloc] init];
    
    if (copy) {

        copy.flag = [self.flag copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
