//
//  CommunitTagAction.h
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CommunitTagAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tagActionIdentifier;
@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *tag;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
