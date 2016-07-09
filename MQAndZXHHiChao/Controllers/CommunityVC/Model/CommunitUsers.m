//
//  CommunitUsers.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitUsers.h"
#import "CommunitAction.h"


NSString *const kCommunitUsersUsername = @"username";
NSString *const kCommunitUsersUserAvatar = @"userAvatar";
NSString *const kCommunitUsersUserId = @"userId";
NSString *const kCommunitUsersAction = @"action";


@interface CommunitUsers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitUsers

@synthesize username = _username;
@synthesize userAvatar = _userAvatar;
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
            self.username = [self objectOrNilForKey:kCommunitUsersUsername fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kCommunitUsersUserAvatar fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kCommunitUsersUserId fromDictionary:dict];
            self.action = [CommunitAction modelObjectWithDictionary:[dict objectForKey:kCommunitUsersAction]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.username forKey:kCommunitUsersUsername];
    [mutableDict setValue:self.userAvatar forKey:kCommunitUsersUserAvatar];
    [mutableDict setValue:self.userId forKey:kCommunitUsersUserId];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kCommunitUsersAction];

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

    self.username = [aDecoder decodeObjectForKey:kCommunitUsersUsername];
    self.userAvatar = [aDecoder decodeObjectForKey:kCommunitUsersUserAvatar];
    self.userId = [aDecoder decodeObjectForKey:kCommunitUsersUserId];
    self.action = [aDecoder decodeObjectForKey:kCommunitUsersAction];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_username forKey:kCommunitUsersUsername];
    [aCoder encodeObject:_userAvatar forKey:kCommunitUsersUserAvatar];
    [aCoder encodeObject:_userId forKey:kCommunitUsersUserId];
    [aCoder encodeObject:_action forKey:kCommunitUsersAction];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitUsers *copy = [[CommunitUsers alloc] init];
    
    if (copy) {

        copy.username = [self.username copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
    }
    
    return copy;
}


@end
