//
//  ViewController.m
//  ButtonEventCustomCellViaNSNotification
//
//  Created by 刘宏立 on 2016/11/25.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "ViewController.h"
#import "HLCustomCell.h"
#import "HLZiXiaXianZiViewController.h"

extern NSString *const HLYueGuangBaoHeNotification;

static NSString *cellId = @"cellId";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通知传递事件";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(yueGuangBaohe) name:HLYueGuangBaoHeNotification object:nil];
    
    [self setupUI];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)yueGuangBaohe {
    NSLog(@"马上就见到紫霞了,好激动");
    HLZiXiaXianZiViewController *vc = [[HLZiXiaXianZiViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - 设置界面
- (void)setupUI {
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tv];
    
    tv.rowHeight = 200;
    
    [tv registerClass:[HLCustomCell class] forCellReuseIdentifier:cellId];
    
    tv.dataSource = self;
    tv.delegate = self;
}


@end
