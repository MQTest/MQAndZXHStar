//
//  CommunitShareAction.h
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CommunitShare;

@interface CommunitShareAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) CommunitShare *share;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
