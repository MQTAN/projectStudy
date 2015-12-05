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

/**日的数组*/
@property(nonatomic, strong) NSArray *dayArray;
/**时*/
@property(nonatomic, strong) NSArray *hourArray;
@end
@implementation MQDatePickerView
- (NSArray *)hourArray{
    if (!_hourArray) {
        _hourArray = @[
                       @"1 : 00",@"2 : 00",@"3 : 00",@"4 : 00",@"5 : 00",@"6 : 00",
                       @"7 : 00",@"8 : 00",@"9 : 00",@"10 : 00",@"11 : 00",
                       @"12 : 00",@"13 : 00",@"14 : 00",@"15 : 00",
                       @"16 : 00",@"17 : 00",@"18 : 00",@"19 : 00",
                       @"20 : 00",@"21 : 00",@"22 : 00",@"23 : 00"
                       ];
    }
    return _hourArray;
}
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
- (NSArray *)dayArray{
    if (!_dayArray) {
        _dayArray = @[
                      @[
                        @"1",@"2",@"3",@"4",@"5",@"6",
                        @"7",@"8",@"9",@"10",@"11",
                        @"12",@"13",@"14",@"15",
                        @"16",@"17",@"18",@"19",
                        @"20",@"21",@"22",@"23",
                        @"24",@"25",@"26",@"27",
                        @"28",@"29",@"30",@"31"
                          ],
                      @[
                          @"1",@"2",@"3",@"4",@"5",@"6",
                          @"7",@"8",@"9",@"10",@"11",
                          @"12",@"13",@"14",@"15",
                          @"16",@"17",@"18",@"19",
                          @"20",@"21",@"22",@"23",
                          @"24",@"25",@"26",@"27",
                          @"28",@"29",@"30"
                          ],
                      @[
                          @"1",@"2",@"3",@"4",@"5",@"6",
                          @"7",@"8",@"9",@"10",@"11",
                          @"12",@"13",@"14",@"15",
                          @"16",@"17",@"18",@"19",
                          @"20",@"21",@"22",@"23",
                          @"24",@"25",@"26",@"27",
                          @"28"
                          ]
                      ];
    }
    return _dayArray;
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
#pragma mark 默认选中pickview的多少列和行在焦点上面显示
        [self.datePickerView selectRow:5 inComponent:0 animated:YES];
        [self.datePickerView selectRow:14 inComponent:1 animated:YES];
        [self.datePickerView selectRow:11 inComponent:2 animated:YES];
        [self.datePickerView selectRow:11 inComponent:3 animated:YES];
    }
    return self;
}
#pragma mark- pickerview的数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.mounthArray.count;
    }else if (component == 1){
        NSArray *day = self.dayArray[0];
        return day.count;
    }else if (component == 2){
        return self.hourArray.count;
    }else if (component == 3){
        
        return _hourArray.count;
    }else{
        return 0;
    }


}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.mounthArray[row];
    }else if (component == 1){
        NSArray *day = self.dayArray[0];
        return day[row];
    }else if (component == 2){
        return self.hourArray[row];
    }else if (component == 3){
        return _hourArray[row];
    }else{
        return nil;
    }
}
#pragma mark -PickerView的代理方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    NSArray *arr = self.dayArray[0];
//    NSString *str = [NSString stringWithFormat:@"%@-%@-%@-@%",self.mounthArray[row], arr[row],self.hourArray[row], self.hourArray[row]];
    NSInteger row0InCom = [pickerView selectedRowInComponent:0];
    NSInteger row1Incom = [pickerView selectedRowInComponent:1];
    NSInteger row2InCom = [pickerView selectedRowInComponent:2];
    NSInteger row3InCom = [pickerView selectedRowInComponent:3];
    
    NSArray *day = self.dayArray[0];
    NSString *str = [NSString stringWithFormat:@"%@ 月-%@ 日-%@ 时-至-%@ 时", self.mounthArray[row0InCom], day[row1Incom], self.hourArray[row2InCom], _hourArray[row3InCom]];
    [SVProgressHUD showInfoWithStatus:str];
    

}
//- (NSInteger)selectedRowInComponent:(NSInteger)component{
//    if (component == 1) {
//        return 10;
//    }
//    return 3;
//}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.datePickerView.frame = self.bounds;
}
@end
