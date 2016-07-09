//
//  CommunitComponent.h
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CommunitTagAction, CommunitUser, CommunitShareAction, CommunitAction;

@interface CommunitComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *datatime;
@property (nonatomic, strong) NSString *userTypeName;
@property (nonatomic, strong) NSString *componentIdentifier;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, strong) NSString *topPicUrl;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSString *componentDescription;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *collectionType;
@property (nonatomic, strong) CommunitTagAction *tagAction;
@property (nonatomic, strong) CommunitUser *user;
@property (nonatomic, strong) NSString *unixtime;
@property (nonatomic, strong) NSString *collectCCount;
@property (nonatomic, strong) NSString *focusCount;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *iscollect;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *weekDay;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) CommunitShareAction *shareAction;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSString *v;
@property (nonatomic, strong) CommunitAction *action;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *isfocus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
