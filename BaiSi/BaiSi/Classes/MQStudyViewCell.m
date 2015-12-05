//
//  MQStudyViewCell.m
//  BaiSi
//
//  Created by tanmanqi on 15/12/5.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQStudyViewCell.h"

@implementation MQStudyViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.textColor = MQRandomColor;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont systemFontOfSize:24];
        self.textLabel.layer.borderColor = MQRandomColor.CGColor;
        self.textLabel.layer.borderWidth = 0;
        self.textLabel.layer.cornerRadius = 10;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.borderColor = MQRandomColor.CGColor;
        self.layer.cornerRadius = 5;
        
        self.layer.borderWidth = 0.5;
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
