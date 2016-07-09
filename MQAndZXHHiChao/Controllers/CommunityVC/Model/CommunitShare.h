//
//  CommunitShare.h
//
//  Created by   on 16/7/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CommunitShare : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *detailUrl;
@property (nonatomic, strong) NSString *shareType;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *shareIdentifier;
@property (nonatomic, strong) NSString *shareDescription;
@property (nonatomic, strong) NSString *picUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
