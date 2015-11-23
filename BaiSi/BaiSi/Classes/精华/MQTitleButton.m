//
//  MQTitleButton.m
//  BaiSi
//
//  Created by DODI on 15/11/23.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQTitleButton.h"

@implementation MQTitleButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return self;
}


@end
