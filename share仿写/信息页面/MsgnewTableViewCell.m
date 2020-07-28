//
//  MsgnewTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "MsgnewTableViewCell.h"

@implementation MsgnewTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _picture = [[UIImageView alloc]initWithFrame:CGRectMake(40, 10, 60, 60)];
    [self.contentView addSubview:_picture];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(130, 30, 120, 20)];
    [self.contentView addSubview:_name];
    
    _guanzhu = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_guanzhu];
    
    return self;
}

-(void)layoutSubviews{
    _guanzhu.frame = CGRectMake(300, 30, 60, 25);
    [_guanzhu setImage:[UIImage imageNamed:@"guanzhu_normal.png"] forState:UIControlStateNormal];
    [_guanzhu addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
}

-(void)press{
    _guanzhu.selected = !_guanzhu.selected;
    if (_guanzhu.selected) {
        [_guanzhu setImage:[[UIImage imageNamed:@"guanzhu_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    }
    else{
        [_guanzhu setImage:[[UIImage imageNamed:@"guanzhu_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal];
    }
}
@end
