//
//  MQDatePicker.m
//  BaiSi
//
//  Created by tanmanqi on 15/12/5.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQDatePicker.h"

@interface MQDatePicker ()
/**UIDatePicker*/
@property(nonatomic, strong) UIDatePicker *datePicker;
@end
@implementation MQDatePicker
- (UIDatePicker *)datePicker{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.backgroundColor = MQRandomColor;
        [self addSubview:_datePicker];
        [_datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
        
        [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
        NSString *dataString = @"1999-1-1";
        NSDateFormatter *forma = [[NSDateFormatter alloc] init];
        [forma setDateFormat:@"yyyy-MM-dd"];
        NSDate *dataFromS = [forma dateFromString:dataString];
        _datePicker.minimumDate = dataFromS;
//        _datePicker.maximumDate = 
        [_datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"]];
        
        
         [_datePicker setTimeZone:[NSTimeZone timeZoneWithName:@"GMT-8"]];
    }
    return _datePicker;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = MQRandomColor;
        //        [self addSubview:self.datePicker];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.datePicker.frame = self.bounds;
}

- (void)datePickerValueChange:(UIDatePicker *)datePicker{
    MQLogLine(@"%@", datePicker.date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 1.1 先设置日期的格式字符串
    [formatter setDateFormat:@"yyyy-MM-dd-hh-mm-ss"];
    
    // 1.2 使用格式字符串, 将日期转换成字符串
    NSString *dateString = [formatter stringFromDate:datePicker.date];
    
    [SVProgressHUD showInfoWithStatus:dateString];
}
@end
