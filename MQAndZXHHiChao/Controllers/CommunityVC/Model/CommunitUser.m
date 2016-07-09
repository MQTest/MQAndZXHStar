//
//  CommunitUser.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitUser.h"
#import "CommunitAction.h"


NSString *const kCommunitUserUsername = @"username";
NSString *const kCommunitUserUserAvatar = @"userAvatar";
NSString *const kCommunitUserDatatime = @"datatime";
NSString *const kCommunitUserUserId = @"userId";
NSString *const kCommunitUserAction = @"action";


@interface CommunitUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitUser

@synthesize username = _username;
@synthesize userAvatar = _userAvatar;
@synthesize datatime = _datatime;
@synthesize userId = _userId;
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
            self.username = [self objectOrNilForKey:kCommunitUserUsername fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kCommunitUserUserAvatar fromDictionary:dict];
            self.datatime = [self objectOrNilForKey:kCommunitUserDatatime fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kCommunitUserUserId fromDictionary:dict];
            self.action = [CommunitAction modelObjectWithDictionary:[dict objectForKey:kCommunitUserAction]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.username forKey:kCommunitUserUsername];
    [mutableDict setValue:self.userAvatar forKey:kCommunitUserUserAvatar];
    [mutableDict setValue:self.datatime forKey:kCommunitUserDatatime];
    [mutableDict setValue:self.userId forKey:kCommunitUserUserId];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kCommunitUserAction];

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

    self.username = [aDecoder decodeObjectForKey:kCommunitUserUsername];
    self.userAvatar = [aDecoder decodeObjectForKey:kCommunitUserUserAvatar];
    self.datatime = [aDecoder decodeObjectForKey:kCommunitUserDatatime];
    self.userId = [aDecoder decodeObjectForKey:kCommunitUserUserId];
    self.action = [aDecoder decodeObjectForKey:kCommunitUserAction];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_username forKey:kCommunitUserUsername];
    [aCoder encodeObject:_userAvatar forKey:kCommunitUserUserAvatar];
    [aCoder encodeObject:_datatime forKey:kCommunitUserDatatime];
    [aCoder encodeObject:_userId forKey:kCommunitUserUserId];
    [aCoder encodeObject:_action forKey:kCommunitUserAction];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitUser *copy = [[CommunitUser alloc] init];
    
    if (copy) {

        copy.username = [self.username copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.datatime = [self.datatime copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
    }
    
    return copy;
}


@end
