//
//  MQTag2TableViewCell.m
//  BaiSi
//
//  Created by DODI on 15/11/25.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQTag2TableViewCell.h"

@interface MQTag2TableViewCell ()

@end
@implementation MQTag2TableViewCell
- (IBAction)buttonClick:(id)sender {
    
    MQLogLine(@"点击了这个button, 让控制器去跳转");
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
