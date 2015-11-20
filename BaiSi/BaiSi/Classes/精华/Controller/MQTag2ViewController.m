//
//  MQTag2ViewController.m
//  BaiSi
//
//  Created by DODI on 15/11/20.
//  Copyright © 2015年 DuoDi. All rights reserved.
//

#import "MQTag2ViewController.h"

@interface MQTag2ViewController ()

@end

@implementation MQTag2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MQRandomColor;
    [self setTableView];
}

- (void)setTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"buh ";
    return cell;
}
@end