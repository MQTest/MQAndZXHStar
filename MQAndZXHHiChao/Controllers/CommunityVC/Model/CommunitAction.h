//
//  CommunitAction.h
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CommunitAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *v;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *unixtime;
@property (nonatomic, strong) NSString *commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
