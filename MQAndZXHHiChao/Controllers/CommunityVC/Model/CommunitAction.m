//
//  CommunitAction.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitAction.h"


NSString *const kCommunitActionActionType = @"actionType";
NSString *const kCommunitActionId = @"id";
NSString *const kCommunitActionTitle = @"title";
NSString *const kCommunitActionTag = @"tag";
NSString *const kCommunitActionV = @"v";
NSString *const kCommunitActionType = @"type";
NSString *const kCommunitActionCollectionCount = @"collectionCount";
NSString *const kCommunitActionUnixtime = @"unixtime";
NSString *const kCommunitActionCommentCount = @"commentCount";


@interface CommunitAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitAction

@synthesize actionType = _actionType;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize title = _title;
@synthesize tag = _tag;
@synthesize v = _v;
@synthesize type = _type;
@synthesize collectionCount = _collectionCount;
@synthesize unixtime = _unixtime;
@synthesize commentCount = _commentCount;


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
            self.actionType = [self objectOrNilForKey:kCommunitActionActionType fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kCommunitActionId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCommunitActionTitle fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kCommunitActionTag fromDictionary:dict];
            self.v = [self objectOrNilForKey:kCommunitActionV fromDictionary:dict];
            self.type = [self objectOrNilForKey:kCommunitActionType fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kCommunitActionCollectionCount fromDictionary:dict];
            self.unixtime = [self objectOrNilForKey:kCommunitActionUnixtime fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kCommunitActionCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kCommunitActionActionType];
    [mutableDict setValue:self.actionIdentifier forKey:kCommunitActionId];
    [mutableDict setValue:self.title forKey:kCommunitActionTitle];
    [mutableDict setValue:self.tag forKey:kCommunitActionTag];
    [mutableDict setValue:self.v forKey:kCommunitActionV];
    [mutableDict setValue:self.type forKey:kCommunitActionType];
    [mutableDict setValue:self.collectionCount forKey:kCommunitActionCollectionCount];
    [mutableDict setValue:self.unixtime forKey:kCommunitActionUnixtime];
    [mutableDict setValue:self.commentCount forKey:kCommunitActionCommentCount];

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

    self.actionType = [aDecoder decodeObjectForKey:kCommunitActionActionType];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kCommunitActionId];
    self.title = [aDecoder decodeObjectForKey:kCommunitActionTitle];
    self.tag = [aDecoder decodeObjectForKey:kCommunitActionTag];
    self.v = [aDecoder decodeObjectForKey:kCommunitActionV];
    self.type = [aDecoder decodeObjectForKey:kCommunitActionType];
    self.collectionCount = [aDecoder decodeObjectForKey:kCommunitActionCollectionCount];
    self.unixtime = [aDecoder decodeObjectForKey:kCommunitActionUnixtime];
    self.commentCount = [aDecoder decodeObjectForKey:kCommunitActionCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kCommunitActionActionType];
    [aCoder encodeObject:_actionIdentifier forKey:kCommunitActionId];
    [aCoder encodeObject:_title forKey:kCommunitActionTitle];
    [aCoder encodeObject:_tag forKey:kCommunitActionTag];
    [aCoder encodeObject:_v forKey:kCommunitActionV];
    [aCoder encodeObject:_type forKey:kCommunitActionType];
    [aCoder encodeObject:_collectionCount forKey:kCommunitActionCollectionCount];
    [aCoder encodeObject:_unixtime forKey:kCommunitActionUnixtime];
    [aCoder encodeObject:_commentCount forKey:kCommunitActionCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitAction *copy = [[CommunitAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.v = [self.v copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.unixtime = [self.unixtime copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


@end
