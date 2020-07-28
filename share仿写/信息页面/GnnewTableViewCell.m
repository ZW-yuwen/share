//
//  GnnewTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GnnewTableViewCell.h"

@implementation GnnewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(35, 15, 300, 20)];
    [self.contentView addSubview:_name];
    
    _right = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_right];
    
    return self;
}

-(void)layoutSubviews{
    _right.frame = CGRectMake(350, 15, 20, 20);
    [_right setImage:[UIImage imageNamed:@"my_button_normal.png"] forState:UIControlStateNormal];
    [_right addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
}

-(void)press{
   _right.selected = !_right.selected;
    if (_right.selected) {
        [_right setImage:[[UIImage imageNamed:@"my_button_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    }
    else{
        [_right setImage:[[UIImage imageNamed:@"my_button_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal];
    }
    
}
@end
