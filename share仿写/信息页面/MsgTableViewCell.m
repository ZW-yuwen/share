//
//  MsgTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "MsgTableViewCell.h"

@implementation MsgTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _lbName = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 100, 20)];
    [self.contentView addSubview:_lbName];
    
    _lbNum = [[UILabel alloc]initWithFrame:CGRectMake(380, 15, 20, 20)];
    [self.contentView addSubview:_lbNum];
    
    _pic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img3.png"]];
    [self.contentView addSubview:_pic];
    
    return self;
}

-(void)layoutSubviews{
    _lbNum.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    _pic.frame = CGRectMake(350, 15, 20, 20);
}

@end
