//
//  CommunitTagAction.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitTagAction.h"


NSString *const kCommunitTagActionId = @"id";
NSString *const kCommunitTagActionActionType = @"actionType";
NSString *const kCommunitTagActionType = @"type";
NSString *const kCommunitTagActionTag = @"tag";


@interface CommunitTagAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitTagAction

@synthesize tagActionIdentifier = _tagActionIdentifier;
@synthesize actionType = _actionType;
@synthesize type = _type;
@synthesize tag = _tag;


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
            self.tagActionIdentifier = [self objectOrNilForKey:kCommunitTagActionId fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kCommunitTagActionActionType fromDictionary:dict];
            self.type = [self objectOrNilForKey:kCommunitTagActionType fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kCommunitTagActionTag fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tagActionIdentifier forKey:kCommunitTagActionId];
    [mutableDict setValue:self.actionType forKey:kCommunitTagActionActionType];
    [mutableDict setValue:self.type forKey:kCommunitTagActionType];
    [mutableDict setValue:self.tag forKey:kCommunitTagActionTag];

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

    self.tagActionIdentifier = [aDecoder decodeObjectForKey:kCommunitTagActionId];
    self.actionType = [aDecoder decodeObjectForKey:kCommunitTagActionActionType];
    self.type = [aDecoder decodeObjectForKey:kCommunitTagActionType];
    self.tag = [aDecoder decodeObjectForKey:kCommunitTagActionTag];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tagActionIdentifier forKey:kCommunitTagActionId];
    [aCoder encodeObject:_actionType forKey:kCommunitTagActionActionType];
    [aCoder encodeObject:_type forKey:kCommunitTagActionType];
    [aCoder encodeObject:_tag forKey:kCommunitTagActionTag];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitTagAction *copy = [[CommunitTagAction alloc] init];
    
    if (copy) {

        copy.tagActionIdentifier = [self.tagActionIdentifier copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
    }
    
    return copy;
}


@end
