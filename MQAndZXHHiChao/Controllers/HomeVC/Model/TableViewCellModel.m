//
//  TableViewCellModel.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/5.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "TableViewCellModel.h"

@implementation TableViewCellModel


- (instancetype)initModelWithDic:(NSDictionary *)dic;
{
    self = [super init];
    if (self) {
        
        self.width = [dic[@"width"] floatValue];
        self.height = [dic[@"height"] floatValue];
        self.curHeight = self.height*(kMainBoundsW/2-5)/self.width;
        
        NSDictionary *tempDic = dic[@"component"];
        [self setValuesForKeysWithDictionary:tempDic];
//        NSLog(@"%@",self.country);
        
        
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"description"]) {
//        [self.myDescription setValue:value forKey:key];
        self.myDescription = value;
        
    }
    if ([key isEqualToString:@"picUrl"]) {
        NSString *urlStr = [[value componentsSeparatedByString:@"?"] firstObject];
        self.picUrl = urlStr;
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


@end
