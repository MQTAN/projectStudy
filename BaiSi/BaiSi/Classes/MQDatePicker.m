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
@property(nonatomic, strong) UIDatePicker *datePicker_;
@end
@implementation MQDatePicker
- (UIDatePicker *)datePicker_{
    if (!_datePicker_) {
        _datePicker_ = [[UIDatePicker alloc]init];
    }
    return _datePicker_;
}

@end
