//
//  CommunitTags.h
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CommunitAction;

@interface CommunitTags : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tagsIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) CommunitAction *action;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
