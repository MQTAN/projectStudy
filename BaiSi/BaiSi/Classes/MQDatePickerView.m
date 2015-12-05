//
//  MQDatePickerView.m
//  wenlouApp
//
//  Created by DODI on 15/12/5.
//  Copyright © 2015年 cn.dodi. All rights reserved.
//

#import "MQDatePickerView.h"



@interface MQDatePickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>

/**pickerview*/
@property(nonatomic, strong) UIPickerView *datePickerView;

/**Pickerview的头部的view*/
@property(nonatomic, strong) UIView *topView;

/**月份的数字*/
@property(nonatomic, strong)  NSArray *mounthArray;

@end
@implementation MQDatePickerView
- (NSArray *)mounthArray{
    if (!_mounthArray) {
        _mounthArray = @[
                         @"1",
                         @"2",
                         @"3",
                         @"4",
                         @"5",
                         @"6",
                         @"7",
                         @"8",
                         @"9",
                         @"10",
                         @"11",
                         @"12",
                         ];
    }
    return _mounthArray;
}

- (UIPickerView *)datePickerView{
    if (!_datePickerView) {
        _datePickerView = [[UIPickerView alloc] init];
        [self addSubview:_datePickerView];
    }
    return _datePickerView;
}
- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        [self addSubview:_topView];
    }
    
    
    return _topView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.datePickerView.delegate = self;
        self.datePickerView.dataSource = self;
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.mounthArray.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _mounthArray[row];
}
@end
