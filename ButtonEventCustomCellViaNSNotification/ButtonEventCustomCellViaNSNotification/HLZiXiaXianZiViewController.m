//
//  HLZiXiaXianZiViewController.m
//  ButtonEventCustomCellViaNSNotification
//
//  Created by 刘宏立 on 2016/11/26.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "HLZiXiaXianZiViewController.h"
#import "Masonry.h"

@interface HLZiXiaXianZiViewController ()

@end

@implementation HLZiXiaXianZiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我是紫霞仙子";
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置界面
- (void)setupUI {
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"000.jpg"]];
    [self.view addSubview:iv];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    /*
     图片填充模式:
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     */
    UIImageView *iv2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"003.jpg"]];
    [self.view addSubview:iv2];
    
    iv2.contentMode = UIViewContentModeScaleAspectFit;
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(300);
    }];
    
    [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iv.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(300);
    }];
    
    
}

@end
