//
//  MQEssenceViewController.m
//  BaiSi
//
//  Created by 叉烧肥包 on 15/11/17.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQEssenceViewController.h"
#import "MQTagViewController.h"

@interface MQEssenceViewController ()

@property(nonatomic, weak) UIView *topicView;
@end

@implementation MQEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self setNav];
    [self setTopicView];
    MQLogLine(@"topicview = %@", NSStringFromCGRect(self.topicView.frame));
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.topicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}
- (void)setTopicView{
    UIView *topicView = [[UIView alloc] init];
    self.topicView = topicView;
    topicView.frame = CGRectMake(0, MQNavBarMaxY, self.view.width, 44);
    topicView.backgroundColor = [UIColor redColor];
    [self.view addSubview:topicView];
}
- (void)setNav{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagClick)];
    self.view.backgroundColor = MQRandomColor;
    
}
#pragma mark- 左边的控制栏按钮
- (void)tagClick{
    MQLog(@"不是你的错,我的错误");
    UIViewController *VC = [[MQTagViewController alloc] init];
    VC.view.backgroundColor = MQRandomColor;
    //导航控制器能够push到下一个控制器
    [self.navigationController pushViewController:VC animated:YES];}


@end
