//
//  FirstViewController.m
//  STTest
//
//  Created by 刘敏 on 16/5/30.
//  Copyright © 2016年 深圳市轩腾华兴科技开发有限公司. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"


@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavBarTitle:@"主页"];
    [self setNavBarLeftBtn:nil];
    UITableView *tableView = [[UITableView alloc] initWithFrame:MAINSCREEN style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //校正滚动区域
    [self resetScrollView:_tableView tabBar:NO];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 25;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        [cell.textLabel setFont:[UIFont systemFontOfSize:16.0]];
        [cell.textLabel setTextColor:[UIColor blackColor]];
        
        
        cell.detailTextLabel.minimumScaleFactor = 0.6f;
        cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
        [cell.detailTextLabel setFont:[UIFont systemFontOfSize:15.0]];
        [cell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    }
    
    cell.textLabel.text = @"你好，不支持手势返回";
    
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ViewController *VC = [[ViewController alloc] init];
    VC.hidesBottomBarWhenPushed = YES;
    //不支持手势返回
    [self navigationCanDragBack:NO];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
