//
//  CommunitComponent.m
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommunitComponent.h"
#import "CommunitUsers.h"
#import "CommunitComments.h"
#import "CommunitTagAction.h"
#import "CommunitUser.h"
#import "CommunitTags.h"
#import "CommunitShareAction.h"
#import "CommunitAction.h"


NSString *const kCommunitComponentDatatime = @"datatime";
NSString *const kCommunitComponentUserTypeName = @"userTypeName";
NSString *const kCommunitComponentId = @"id";
NSString *const kCommunitComponentUsers = @"users";
NSString *const kCommunitComponentTopPicUrl = @"topPicUrl";
NSString *const kCommunitComponentCategory = @"category";
NSString *const kCommunitComponentDay = @"day";
NSString *const kCommunitComponentCollectionCount = @"collectionCount";
NSString *const kCommunitComponentComments = @"comments";
NSString *const kCommunitComponentCommentCount = @"commentCount";
NSString *const kCommunitComponentDescription = @"description";
NSString *const kCommunitComponentPics = @"pics";
NSString *const kCommunitComponentFlag = @"flag";
NSString *const kCommunitComponentYear = @"year";
NSString *const kCommunitComponentPicUrl = @"picUrl";
NSString *const kCommunitComponentType = @"type";
NSString *const kCommunitComponentCollectionType = @"collectionType";
NSString *const kCommunitComponentTagAction = @"tagAction";
NSString *const kCommunitComponentUser = @"user";
NSString *const kCommunitComponentUnixtime = @"unixtime";
NSString *const kCommunitComponentCollectCCount = @"collectCCount";
NSString *const kCommunitComponentFocusCount = @"focusCount";
NSString *const kCommunitComponentTags = @"tags";
NSString *const kCommunitComponentIscollect = @"iscollect";
NSString *const kCommunitComponentContent = @"content";
NSString *const kCommunitComponentWeekDay = @"weekDay";
NSString *const kCommunitComponentMonth = @"month";
NSString *const kCommunitComponentShareAction = @"shareAction";
NSString *const kCommunitComponentComponentType = @"componentType";
NSString *const kCommunitComponentV = @"v";
NSString *const kCommunitComponentAction = @"action";
NSString *const kCommunitComponentUserName = @"userName";
NSString *const kCommunitComponentTitle = @"title";
NSString *const kCommunitComponentUserId = @"userId";
NSString *const kCommunitComponentIsfocus = @"isfocus";


@interface CommunitComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommunitComponent

@synthesize datatime = _datatime;
@synthesize userTypeName = _userTypeName;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize users = _users;
@synthesize topPicUrl = _topPicUrl;
@synthesize category = _category;
@synthesize day = _day;
@synthesize collectionCount = _collectionCount;
@synthesize comments = _comments;
@synthesize commentCount = _commentCount;
@synthesize componentDescription = _componentDescription;
@synthesize pics = _pics;
@synthesize flag = _flag;
@synthesize year = _year;
@synthesize picUrl = _picUrl;
@synthesize type = _type;
@synthesize collectionType = _collectionType;
@synthesize tagAction = _tagAction;
@synthesize user = _user;
@synthesize unixtime = _unixtime;
@synthesize collectCCount = _collectCCount;
@synthesize focusCount = _focusCount;
@synthesize tags = _tags;
@synthesize iscollect = _iscollect;
@synthesize content = _content;
@synthesize weekDay = _weekDay;
@synthesize month = _month;
@synthesize shareAction = _shareAction;
@synthesize componentType = _componentType;
@synthesize v = _v;
@synthesize action = _action;
@synthesize userName = _userName;
@synthesize title = _title;
@synthesize userId = _userId;
@synthesize isfocus = _isfocus;


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
            self.datatime = [self objectOrNilForKey:kCommunitComponentDatatime fromDictionary:dict];
            self.userTypeName = [self objectOrNilForKey:kCommunitComponentUserTypeName fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kCommunitComponentId fromDictionary:dict];
    NSObject *receivedCommunitUsers = [dict objectForKey:kCommunitComponentUsers];
    NSMutableArray *parsedCommunitUsers = [NSMutableArray array];
    if ([receivedCommunitUsers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCommunitUsers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCommunitUsers addObject:[CommunitUsers modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCommunitUsers isKindOfClass:[NSDictionary class]]) {
       [parsedCommunitUsers addObject:[CommunitUsers modelObjectWithDictionary:(NSDictionary *)receivedCommunitUsers]];
    }

    self.users = [NSArray arrayWithArray:parsedCommunitUsers];
            self.topPicUrl = [self objectOrNilForKey:kCommunitComponentTopPicUrl fromDictionary:dict];
            self.category = [self objectOrNilForKey:kCommunitComponentCategory fromDictionary:dict];
            self.day = [self objectOrNilForKey:kCommunitComponentDay fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kCommunitComponentCollectionCount fromDictionary:dict];
    NSObject *receivedCommunitComments = [dict objectForKey:kCommunitComponentComments];
    NSMutableArray *parsedCommunitComments = [NSMutableArray array];
    if ([receivedCommunitComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCommunitComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCommunitComments addObject:[CommunitComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCommunitComments isKindOfClass:[NSDictionary class]]) {
       [parsedCommunitComments addObject:[CommunitComments modelObjectWithDictionary:(NSDictionary *)receivedCommunitComments]];
    }

    self.comments = [NSArray arrayWithArray:parsedCommunitComments];
            self.commentCount = [self objectOrNilForKey:kCommunitComponentCommentCount fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kCommunitComponentDescription fromDictionary:dict];
            self.pics = [self objectOrNilForKey:kCommunitComponentPics fromDictionary:dict];
            self.flag = [self objectOrNilForKey:kCommunitComponentFlag fromDictionary:dict];
            self.year = [self objectOrNilForKey:kCommunitComponentYear fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kCommunitComponentPicUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kCommunitComponentType fromDictionary:dict];
            self.collectionType = [self objectOrNilForKey:kCommunitComponentCollectionType fromDictionary:dict];
            self.tagAction = [CommunitTagAction modelObjectWithDictionary:[dict objectForKey:kCommunitComponentTagAction]];
            self.user = [CommunitUser modelObjectWithDictionary:[dict objectForKey:kCommunitComponentUser]];
            self.unixtime = [self objectOrNilForKey:kCommunitComponentUnixtime fromDictionary:dict];
            self.collectCCount = [self objectOrNilForKey:kCommunitComponentCollectCCount fromDictionary:dict];
            self.focusCount = [self objectOrNilForKey:kCommunitComponentFocusCount fromDictionary:dict];
    NSObject *receivedCommunitTags = [dict objectForKey:kCommunitComponentTags];
    NSMutableArray *parsedCommunitTags = [NSMutableArray array];
    if ([receivedCommunitTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCommunitTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCommunitTags addObject:[CommunitTags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCommunitTags isKindOfClass:[NSDictionary class]]) {
       [parsedCommunitTags addObject:[CommunitTags modelObjectWithDictionary:(NSDictionary *)receivedCommunitTags]];
    }

    self.tags = [NSArray arrayWithArray:parsedCommunitTags];
            self.iscollect = [self objectOrNilForKey:kCommunitComponentIscollect fromDictionary:dict];
            self.content = [self objectOrNilForKey:kCommunitComponentContent fromDictionary:dict];
            self.weekDay = [self objectOrNilForKey:kCommunitComponentWeekDay fromDictionary:dict];
            self.month = [self objectOrNilForKey:kCommunitComponentMonth fromDictionary:dict];
            self.shareAction = [CommunitShareAction modelObjectWithDictionary:[dict objectForKey:kCommunitComponentShareAction]];
            self.componentType = [self objectOrNilForKey:kCommunitComponentComponentType fromDictionary:dict];
            self.v = [self objectOrNilForKey:kCommunitComponentV fromDictionary:dict];
            self.action = [CommunitAction modelObjectWithDictionary:[dict objectForKey:kCommunitComponentAction]];
            self.userName = [self objectOrNilForKey:kCommunitComponentUserName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCommunitComponentTitle fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kCommunitComponentUserId fromDictionary:dict];
            self.isfocus = [self objectOrNilForKey:kCommunitComponentIsfocus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.datatime forKey:kCommunitComponentDatatime];
    [mutableDict setValue:self.userTypeName forKey:kCommunitComponentUserTypeName];
    [mutableDict setValue:self.componentIdentifier forKey:kCommunitComponentId];
    NSMutableArray *tempArrayForUsers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.users) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUsers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUsers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUsers] forKey:kCommunitComponentUsers];
    [mutableDict setValue:self.topPicUrl forKey:kCommunitComponentTopPicUrl];
    [mutableDict setValue:self.category forKey:kCommunitComponentCategory];
    [mutableDict setValue:self.day forKey:kCommunitComponentDay];
    [mutableDict setValue:self.collectionCount forKey:kCommunitComponentCollectionCount];
    NSMutableArray *tempArrayForComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.comments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComments] forKey:kCommunitComponentComments];
    [mutableDict setValue:self.commentCount forKey:kCommunitComponentCommentCount];
    [mutableDict setValue:self.componentDescription forKey:kCommunitComponentDescription];
    NSMutableArray *tempArrayForPics = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pics) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPics addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPics addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kCommunitComponentPics];
    [mutableDict setValue:self.flag forKey:kCommunitComponentFlag];
    [mutableDict setValue:self.year forKey:kCommunitComponentYear];
    [mutableDict setValue:self.picUrl forKey:kCommunitComponentPicUrl];
    [mutableDict setValue:self.type forKey:kCommunitComponentType];
    [mutableDict setValue:self.collectionType forKey:kCommunitComponentCollectionType];
    [mutableDict setValue:[self.tagAction dictionaryRepresentation] forKey:kCommunitComponentTagAction];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kCommunitComponentUser];
    [mutableDict setValue:self.unixtime forKey:kCommunitComponentUnixtime];
    [mutableDict setValue:self.collectCCount forKey:kCommunitComponentCollectCCount];
    [mutableDict setValue:self.focusCount forKey:kCommunitComponentFocusCount];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kCommunitComponentTags];
    [mutableDict setValue:self.iscollect forKey:kCommunitComponentIscollect];
    [mutableDict setValue:self.content forKey:kCommunitComponentContent];
    [mutableDict setValue:self.weekDay forKey:kCommunitComponentWeekDay];
    [mutableDict setValue:self.month forKey:kCommunitComponentMonth];
    [mutableDict setValue:[self.shareAction dictionaryRepresentation] forKey:kCommunitComponentShareAction];
    [mutableDict setValue:self.componentType forKey:kCommunitComponentComponentType];
    [mutableDict setValue:self.v forKey:kCommunitComponentV];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kCommunitComponentAction];
    [mutableDict setValue:self.userName forKey:kCommunitComponentUserName];
    [mutableDict setValue:self.title forKey:kCommunitComponentTitle];
    [mutableDict setValue:self.userId forKey:kCommunitComponentUserId];
    [mutableDict setValue:self.isfocus forKey:kCommunitComponentIsfocus];

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

    self.datatime = [aDecoder decodeObjectForKey:kCommunitComponentDatatime];
    self.userTypeName = [aDecoder decodeObjectForKey:kCommunitComponentUserTypeName];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kCommunitComponentId];
    self.users = [aDecoder decodeObjectForKey:kCommunitComponentUsers];
    self.topPicUrl = [aDecoder decodeObjectForKey:kCommunitComponentTopPicUrl];
    self.category = [aDecoder decodeObjectForKey:kCommunitComponentCategory];
    self.day = [aDecoder decodeObjectForKey:kCommunitComponentDay];
    self.collectionCount = [aDecoder decodeObjectForKey:kCommunitComponentCollectionCount];
    self.comments = [aDecoder decodeObjectForKey:kCommunitComponentComments];
    self.commentCount = [aDecoder decodeObjectForKey:kCommunitComponentCommentCount];
    self.componentDescription = [aDecoder decodeObjectForKey:kCommunitComponentDescription];
    self.pics = [aDecoder decodeObjectForKey:kCommunitComponentPics];
    self.flag = [aDecoder decodeObjectForKey:kCommunitComponentFlag];
    self.year = [aDecoder decodeObjectForKey:kCommunitComponentYear];
    self.picUrl = [aDecoder decodeObjectForKey:kCommunitComponentPicUrl];
    self.type = [aDecoder decodeObjectForKey:kCommunitComponentType];
    self.collectionType = [aDecoder decodeObjectForKey:kCommunitComponentCollectionType];
    self.tagAction = [aDecoder decodeObjectForKey:kCommunitComponentTagAction];
    self.user = [aDecoder decodeObjectForKey:kCommunitComponentUser];
    self.unixtime = [aDecoder decodeObjectForKey:kCommunitComponentUnixtime];
    self.collectCCount = [aDecoder decodeObjectForKey:kCommunitComponentCollectCCount];
    self.focusCount = [aDecoder decodeObjectForKey:kCommunitComponentFocusCount];
    self.tags = [aDecoder decodeObjectForKey:kCommunitComponentTags];
    self.iscollect = [aDecoder decodeObjectForKey:kCommunitComponentIscollect];
    self.content = [aDecoder decodeObjectForKey:kCommunitComponentContent];
    self.weekDay = [aDecoder decodeObjectForKey:kCommunitComponentWeekDay];
    self.month = [aDecoder decodeObjectForKey:kCommunitComponentMonth];
    self.shareAction = [aDecoder decodeObjectForKey:kCommunitComponentShareAction];
    self.componentType = [aDecoder decodeObjectForKey:kCommunitComponentComponentType];
    self.v = [aDecoder decodeObjectForKey:kCommunitComponentV];
    self.action = [aDecoder decodeObjectForKey:kCommunitComponentAction];
    self.userName = [aDecoder decodeObjectForKey:kCommunitComponentUserName];
    self.title = [aDecoder decodeObjectForKey:kCommunitComponentTitle];
    self.userId = [aDecoder decodeObjectForKey:kCommunitComponentUserId];
    self.isfocus = [aDecoder decodeObjectForKey:kCommunitComponentIsfocus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_datatime forKey:kCommunitComponentDatatime];
    [aCoder encodeObject:_userTypeName forKey:kCommunitComponentUserTypeName];
    [aCoder encodeObject:_componentIdentifier forKey:kCommunitComponentId];
    [aCoder encodeObject:_users forKey:kCommunitComponentUsers];
    [aCoder encodeObject:_topPicUrl forKey:kCommunitComponentTopPicUrl];
    [aCoder encodeObject:_category forKey:kCommunitComponentCategory];
    [aCoder encodeObject:_day forKey:kCommunitComponentDay];
    [aCoder encodeObject:_collectionCount forKey:kCommunitComponentCollectionCount];
    [aCoder encodeObject:_comments forKey:kCommunitComponentComments];
    [aCoder encodeObject:_commentCount forKey:kCommunitComponentCommentCount];
    [aCoder encodeObject:_componentDescription forKey:kCommunitComponentDescription];
    [aCoder encodeObject:_pics forKey:kCommunitComponentPics];
    [aCoder encodeObject:_flag forKey:kCommunitComponentFlag];
    [aCoder encodeObject:_year forKey:kCommunitComponentYear];
    [aCoder encodeObject:_picUrl forKey:kCommunitComponentPicUrl];
    [aCoder encodeObject:_type forKey:kCommunitComponentType];
    [aCoder encodeObject:_collectionType forKey:kCommunitComponentCollectionType];
    [aCoder encodeObject:_tagAction forKey:kCommunitComponentTagAction];
    [aCoder encodeObject:_user forKey:kCommunitComponentUser];
    [aCoder encodeObject:_unixtime forKey:kCommunitComponentUnixtime];
    [aCoder encodeObject:_collectCCount forKey:kCommunitComponentCollectCCount];
    [aCoder encodeObject:_focusCount forKey:kCommunitComponentFocusCount];
    [aCoder encodeObject:_tags forKey:kCommunitComponentTags];
    [aCoder encodeObject:_iscollect forKey:kCommunitComponentIscollect];
    [aCoder encodeObject:_content forKey:kCommunitComponentContent];
    [aCoder encodeObject:_weekDay forKey:kCommunitComponentWeekDay];
    [aCoder encodeObject:_month forKey:kCommunitComponentMonth];
    [aCoder encodeObject:_shareAction forKey:kCommunitComponentShareAction];
    [aCoder encodeObject:_componentType forKey:kCommunitComponentComponentType];
    [aCoder encodeObject:_v forKey:kCommunitComponentV];
    [aCoder encodeObject:_action forKey:kCommunitComponentAction];
    [aCoder encodeObject:_userName forKey:kCommunitComponentUserName];
    [aCoder encodeObject:_title forKey:kCommunitComponentTitle];
    [aCoder encodeObject:_userId forKey:kCommunitComponentUserId];
    [aCoder encodeObject:_isfocus forKey:kCommunitComponentIsfocus];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommunitComponent *copy = [[CommunitComponent alloc] init];
    
    if (copy) {

        copy.datatime = [self.datatime copyWithZone:zone];
        copy.userTypeName = [self.userTypeName copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.users = [self.users copyWithZone:zone];
        copy.topPicUrl = [self.topPicUrl copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.year = [self.year copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.collectionType = [self.collectionType copyWithZone:zone];
        copy.tagAction = [self.tagAction copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.unixtime = [self.unixtime copyWithZone:zone];
        copy.collectCCount = [self.collectCCount copyWithZone:zone];
        copy.focusCount = [self.focusCount copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.iscollect = [self.iscollect copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.weekDay = [self.weekDay copyWithZone:zone];
        copy.month = [self.month copyWithZone:zone];
        copy.shareAction = [self.shareAction copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.v = [self.v copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.isfocus = [self.isfocus copyWithZone:zone];
    }
    
    return copy;
}


@end
