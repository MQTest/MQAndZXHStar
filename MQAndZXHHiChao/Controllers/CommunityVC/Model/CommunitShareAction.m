//
//  CommunitShareAction.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitShareAction.h"
#import "CommunitShare.h"


NSString *const kCommunitShareActionTrackValue = @"trackValue";
NSString *const kCommunitShareActionTypeId = @"typeId";
NSString *const kCommunitShareActionActionType = @"actionType";
NSString *const kCommunitShareActionType = @"type";
NSString *const kCommunitShareActionShare = @"share";


@interface CommunitShareAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitShareAction

@synthesize trackValue = _trackValue;
@synthesize typeId = _typeId;
@synthesize actionType = _actionType;
@synthesize type = _type;
@synthesize share = _share;


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
            self.trackValue = [self objectOrNilForKey:kCommunitShareActionTrackValue fromDictionary:dict];
            self.typeId = [self objectOrNilForKey:kCommunitShareActionTypeId fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kCommunitShareActionActionType fromDictionary:dict];
            self.type = [self objectOrNilForKey:kCommunitShareActionType fromDictionary:dict];
            self.share = [CommunitShare modelObjectWithDictionary:[dict objectForKey:kCommunitShareActionShare]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.trackValue forKey:kCommunitShareActionTrackValue];
    [mutableDict setValue:self.typeId forKey:kCommunitShareActionTypeId];
    [mutableDict setValue:self.actionType forKey:kCommunitShareActionActionType];
    [mutableDict setValue:self.type forKey:kCommunitShareActionType];
    [mutableDict setValue:[self.share dictionaryRepresentation] forKey:kCommunitShareActionShare];

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

    self.trackValue = [aDecoder decodeObjectForKey:kCommunitShareActionTrackValue];
    self.typeId = [aDecoder decodeObjectForKey:kCommunitShareActionTypeId];
    self.actionType = [aDecoder decodeObjectForKey:kCommunitShareActionActionType];
    self.type = [aDecoder decodeObjectForKey:kCommunitShareActionType];
    self.share = [aDecoder decodeObjectForKey:kCommunitShareActionShare];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_trackValue forKey:kCommunitShareActionTrackValue];
    [aCoder encodeObject:_typeId forKey:kCommunitShareActionTypeId];
    [aCoder encodeObject:_actionType forKey:kCommunitShareActionActionType];
    [aCoder encodeObject:_type forKey:kCommunitShareActionType];
    [aCoder encodeObject:_share forKey:kCommunitShareActionShare];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitShareAction *copy = [[CommunitShareAction alloc] init];
    
    if (copy) {

        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.typeId = [self.typeId copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.share = [self.share copyWithZone:zone];
    }
    
    return copy;
}


@end
