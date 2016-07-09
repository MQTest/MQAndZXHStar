//
//  CommunitShare.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitShare.h"


NSString *const kCommunitShareDetailUrl = @"detailUrl";
NSString *const kCommunitShareShareType = @"shareType";
NSString *const kCommunitShareTitle = @"title";
NSString *const kCommunitShareId = @"id";
NSString *const kCommunitShareDescription = @"description";
NSString *const kCommunitSharePicUrl = @"picUrl";


@interface CommunitShare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitShare

@synthesize detailUrl = _detailUrl;
@synthesize shareType = _shareType;
@synthesize title = _title;
@synthesize shareIdentifier = _shareIdentifier;
@synthesize shareDescription = _shareDescription;
@synthesize picUrl = _picUrl;


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
            self.detailUrl = [self objectOrNilForKey:kCommunitShareDetailUrl fromDictionary:dict];
            self.shareType = [self objectOrNilForKey:kCommunitShareShareType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCommunitShareTitle fromDictionary:dict];
            self.shareIdentifier = [self objectOrNilForKey:kCommunitShareId fromDictionary:dict];
            self.shareDescription = [self objectOrNilForKey:kCommunitShareDescription fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kCommunitSharePicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.detailUrl forKey:kCommunitShareDetailUrl];
    [mutableDict setValue:self.shareType forKey:kCommunitShareShareType];
    [mutableDict setValue:self.title forKey:kCommunitShareTitle];
    [mutableDict setValue:self.shareIdentifier forKey:kCommunitShareId];
    [mutableDict setValue:self.shareDescription forKey:kCommunitShareDescription];
    [mutableDict setValue:self.picUrl forKey:kCommunitSharePicUrl];

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

    self.detailUrl = [aDecoder decodeObjectForKey:kCommunitShareDetailUrl];
    self.shareType = [aDecoder decodeObjectForKey:kCommunitShareShareType];
    self.title = [aDecoder decodeObjectForKey:kCommunitShareTitle];
    self.shareIdentifier = [aDecoder decodeObjectForKey:kCommunitShareId];
    self.shareDescription = [aDecoder decodeObjectForKey:kCommunitShareDescription];
    self.picUrl = [aDecoder decodeObjectForKey:kCommunitSharePicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_detailUrl forKey:kCommunitShareDetailUrl];
    [aCoder encodeObject:_shareType forKey:kCommunitShareShareType];
    [aCoder encodeObject:_title forKey:kCommunitShareTitle];
    [aCoder encodeObject:_shareIdentifier forKey:kCommunitShareId];
    [aCoder encodeObject:_shareDescription forKey:kCommunitShareDescription];
    [aCoder encodeObject:_picUrl forKey:kCommunitSharePicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitShare *copy = [[CommunitShare alloc] init];
    
    if (copy) {

        copy.detailUrl = [self.detailUrl copyWithZone:zone];
        copy.shareType = [self.shareType copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.shareIdentifier = [self.shareIdentifier copyWithZone:zone];
        copy.shareDescription = [self.shareDescription copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
