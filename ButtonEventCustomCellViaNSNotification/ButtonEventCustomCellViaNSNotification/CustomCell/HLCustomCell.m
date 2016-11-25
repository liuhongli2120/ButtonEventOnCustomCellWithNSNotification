//
//  HLCustomCell.m
//  ButtonEventCustomCellViaNSNotification
//
//  Created by 刘宏立 on 2016/11/25.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "HLCustomCell.h"
#import "Masonry.h"

NSString *const HLYueGuangBaoHeNotification = @"HLYueGuangBaoHeNotification";

@implementation HLCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置界面
- (void)setupUI {
    
    UIImage *image = [UIImage imageNamed:@"jinxishan002.jpg"];
    UIImageView *iv = [[UIImageView alloc]initWithImage:image];
    /*
     图片填充模式:
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     */
    
    iv.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:iv];
    
    UILabel *filmNameLabel = [[UILabel alloc]init];
    filmNameLabel.text = @"大话西游之\n仙履奇缘";
    filmNameLabel.numberOfLines = 0;
    [self.contentView addSubview:filmNameLabel];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:nameLabel];
    nameLabel.backgroundColor = [UIColor purpleColor];
    nameLabel.text = @"至尊宝:";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:button];
    button.backgroundColor = [UIColor cyanColor];
    [button setBackgroundImage:[UIImage imageNamed:@"jinxishan001.jpg"] forState:UIControlStateNormal];
    [button setTitle:@"\n\n\n\n戳我去见紫霞\n月光宝盒" forState:UIControlStateNormal];
    button.titleLabel.numberOfLines = 0;
    
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(30);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.width.height.mas_equalTo(70);
    }];
    
    [filmNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(iv.mas_centerX);
        make.top.equalTo(iv.mas_bottom).offset(10);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iv.mas_right).offset(50);
        make.top.equalTo(iv.mas_top).offset(5);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left);
        make.top.equalTo(nameLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(130);
    }];
    
}


- (void)clickButton {
    NSLog(@"去见紫霞");
    [[NSNotificationCenter defaultCenter] postNotificationName:HLYueGuangBaoHeNotification object:nil];
}

@end
