//
//  MQTag2ViewController.m
//  BaiSi
//
//  Created by DODI on 15/11/20.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQTag2ViewController.h"
#import "MQTag2TableViewCell.h"

@interface MQTag2ViewController ()

@end

@implementation MQTag2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学习cell中button点击事件";
    self.view.backgroundColor = MQRandomColor;
    [self setTableView];
}

- (void)setTableView{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MQTag2TableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
//    self.tableView.estimatedRowHeight = 100;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MQTag2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}
@end