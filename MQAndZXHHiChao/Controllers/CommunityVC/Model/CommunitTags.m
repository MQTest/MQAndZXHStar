//
//  CommunitTags.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitTags.h"
#import "CommunitAction.h"


NSString *const kCommunitTagsId = @"id";
NSString *const kCommunitTagsCategory = @"category";
NSString *const kCommunitTagsAction = @"action";


@interface CommunitTags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitTags

@synthesize tagsIdentifier = _tagsIdentifier;
@synthesize category = _category;
@synthesize action = _action;


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
            self.tagsIdentifier = [self objectOrNilForKey:kCommunitTagsId fromDictionary:dict];
            self.category = [self objectOrNilForKey:kCommunitTagsCategory fromDictionary:dict];
            self.action = [CommunitAction modelObjectWithDictionary:[dict objectForKey:kCommunitTagsAction]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tagsIdentifier forKey:kCommunitTagsId];
    [mutableDict setValue:self.category forKey:kCommunitTagsCategory];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kCommunitTagsAction];

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

    self.tagsIdentifier = [aDecoder decodeObjectForKey:kCommunitTagsId];
    self.category = [aDecoder decodeObjectForKey:kCommunitTagsCategory];
    self.action = [aDecoder decodeObjectForKey:kCommunitTagsAction];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tagsIdentifier forKey:kCommunitTagsId];
    [aCoder encodeObject:_category forKey:kCommunitTagsCategory];
    [aCoder encodeObject:_action forKey:kCommunitTagsAction];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitTags *copy = [[CommunitTags alloc] init];
    
    if (copy) {

        copy.tagsIdentifier = [self.tagsIdentifier copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
    }
    
    return copy;
}


@end
