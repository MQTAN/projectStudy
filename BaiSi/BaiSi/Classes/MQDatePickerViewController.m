//
//  MQDatePickerViewController.m
//  BaiSi
//
//  Created by tanmanqi on 15/12/5.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQDatePickerViewController.h"
#import "MQDatePickerView.h"

@interface MQDatePickerViewController ()

@end

@implementation MQDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNormalPickerView];
    
}
#pragma mark- 普通的pickview学习;
- (void)setNormalPickerView{
    self.view.backgroundColor = MQRandomColor;
    MQDatePickerView *datePickerV = [[MQDatePickerView alloc] init];
    datePickerV.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:datePickerV];
    datePickerV.frame = CGRectMake(0, 300, self.view.width, 400);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
