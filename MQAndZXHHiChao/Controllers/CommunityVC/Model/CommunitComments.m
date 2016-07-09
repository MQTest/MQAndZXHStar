//
//  CommunitComments.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitComments.h"


NSString *const kCommunitCommentsContent = @"content";
NSString *const kCommunitCommentsUsername = @"username";
NSString *const kCommunitCommentsTitle = @"title";


@interface CommunitComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitComments

@synthesize content = _content;
@synthesize username = _username;
@synthesize title = _title;


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
            self.content = [self objectOrNilForKey:kCommunitCommentsContent fromDictionary:dict];
            self.username = [self objectOrNilForKey:kCommunitCommentsUsername fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCommunitCommentsTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kCommunitCommentsContent];
    [mutableDict setValue:self.username forKey:kCommunitCommentsUsername];
    [mutableDict setValue:self.title forKey:kCommunitCommentsTitle];

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

    self.content = [aDecoder decodeObjectForKey:kCommunitCommentsContent];
    self.username = [aDecoder decodeObjectForKey:kCommunitCommentsUsername];
    self.title = [aDecoder decodeObjectForKey:kCommunitCommentsTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kCommunitCommentsContent];
    [aCoder encodeObject:_username forKey:kCommunitCommentsUsername];
    [aCoder encodeObject:_title forKey:kCommunitCommentsTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitComments *copy = [[CommunitComments alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


@end
