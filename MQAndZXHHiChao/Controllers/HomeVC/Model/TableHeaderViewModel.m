//
//  TableHeaderViewModel.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "TableHeaderViewModel.h"

@implementation TableHeaderViewModel

- (instancetype)initModelWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
        self.curHeight = self.height*kMainBoundsW/self.width;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


@end
