//
//  MQEssenceViewController.m
//  BaiSi
//
//  Created by 叉烧肥包 on 15/11/17.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQEssenceViewController.h"
#import "MQTagViewController.h"
#import "MQTitleButton.h"

@interface MQEssenceViewController ()

@property(nonatomic, weak) UIView *topicView;

/**头部空间的butotn*/
@property(nonatomic, strong) NSMutableArray *titlesButton;

/**选中按钮记录*/
@property(nonatomic, weak) MQTitleButton *selectedBtn;

/**底部能够跟随文字移动的view*/
@property(nonatomic, weak) UIView *animantionView;

/**scrollview*/
@property(nonatomic, weak) UIScrollView *scrollview;

@end

@implementation MQEssenceViewController
- (NSMutableArray *)titlesButton{
    if (!_titlesButton) {
        _titlesButton = [NSMutableArray array];
    }
    return _titlesButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self setScrollview];
    [self setTopicView];
}
#pragma mark- scrollview的设置和创建
- (void)setScrollview{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollview = scrollView;
    scrollView.backgroundColor = MQRandomColor;
    [self.view addSubview:scrollView];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma mark- 顶部topview
- (void)setTopicView{
    UIView *topicView = [[UIView alloc] init];
    self.topicView = topicView;
    topicView.frame = CGRectMake(0, MQNavBarMaxY, self.view.width, 44);
    topicView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    [self.view addSubview:topicView];
    
    // 标签栏内部的标签按钮
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSInteger count = titles.count;
    CGFloat buttonW = topicView.width / count;
    CGFloat buttonH = topicView.height;
    CGFloat buttonY = 0;
    CGFloat buttonX = 0;
    for (int i = 0; i < count; i++) {
        MQTitleButton *button = [MQTitleButton buttonWithType:UIButtonTypeCustom];
        [self.titlesButton addObject:button];
        buttonX = i * buttonW;
        [self.topicView addSubview:button];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        MQLogLine(@"按钮的frame= %@", button);
        
    }
    //创建底部的红色条
    UIView *animationView = [[UIView alloc] init];
    animationView.backgroundColor = [self.titlesButton.lastObject titleColorForState:UIControlStateSelected];
    [self.topicView addSubview:animationView];
    animationView.frame = CGRectMake(0, topicView.height, 50, 1);
    self.animantionView = animationView;
    
    //默认选中第一个按钮
    MQTitleButton *firstButton = self.titlesButton.firstObject;
    [firstButton.titleLabel sizeToFit];
    animationView.width = firstButton.titleLabel.width;
    animationView.centerX = firstButton.centerX;
    [self buttonClick:firstButton];
}

- (void)buttonClick:(MQTitleButton *)btn{
    MQLogLine(@"点击了按钮%@", btn);
    //按钮状态三部曲
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.animantionView.centerX = btn.centerX;
        self.animantionView.width = btn.titleLabel.width;
    }];
    
}
- (void)setNav{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagClick)];
    
}
#pragma mark- 左边的控制栏按钮
- (void)tagClick{
    UIViewController *VC = [[MQTagViewController alloc] init];
    VC.view.backgroundColor = MQRandomColor;
    //导航控制器能够push到下一个控制器
    [self.navigationController pushViewController:VC animated:YES];}


@end
