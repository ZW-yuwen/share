//
//  GninforTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GninforTableViewCell.h"

@implementation GninforTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"552"]) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(45, 25, 50, 30)];
        [self.contentView addSubview:_name];
        
        _pic = [[UIImageView alloc]initWithFrame:CGRectMake(120, 10, 60, 60)];
        [self.contentView addSubview:_pic];
    }
    else if ([self.reuseIdentifier isEqualToString:@"553"]){
        _name = [[UILabel alloc]initWithFrame:CGRectMake(45, 10, 50, 30)];
        [self.contentView addSubview:_name];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectMake(120, 15, 300, 20)];
        [self.contentView addSubview:_lbName];
    }
    else{
        _name = [[UILabel alloc]initWithFrame:CGRectMake(45, 10, 50, 30)];
        [self.contentView addSubview:_name];
        
        _left = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_left];
        
        _right = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_right];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectMake(150, 15, 20, 20)];
        [self.contentView addSubview:_lbName];
         _lbName.text = @"男";
        
        _sex = [[UILabel alloc]initWithFrame:CGRectMake(220, 15, 20, 20)];
        [self.contentView addSubview:_sex];
    }
    return self;
}

-(void)layoutSubviews{
    _left.frame = CGRectMake(120, 10, 20, 25);
    [_left setImage:[UIImage imageNamed: @"boy_button.png"] forState:UIControlStateNormal];
    [_left addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    _judge = YES;
    
    _right.frame = CGRectMake(200, 10, 20, 25);
    [_right setImage:[UIImage imageNamed: @"girl_button.png"] forState:UIControlStateNormal];
    [_right addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    
    _sex.text = @"女";
    
}


-(void)pressLeft{
    if (_judge) {
        _judge = NO;
        [_right setImage:[UIImage imageNamed: @"boy_button.png"] forState:UIControlStateNormal];
        [_left setImage:[UIImage imageNamed: @"girl_button.png"] forState:UIControlStateNormal];
    }
    else{
        _judge = YES;
        
        [_right setImage:[UIImage imageNamed: @"girl_button.png"] forState:UIControlStateNormal];
        [_left setImage:[UIImage imageNamed: @"boy_button.png"] forState:UIControlStateNormal];
    }
}

/*
-(void)pressRight{
    if (_right.selected == NO) {
        _right.selected = YES;
        [_right setImage:[UIImage imageNamed: @"boy_button.png"] forState:UIControlStateNormal];
        [_left setImage:[UIImage imageNamed: @"girl_button.png"] forState:UIControlStateNormal];
    }
    else{
        _right.selected = NO;
        [_right setImage:[UIImage imageNamed: @"girl_button.png"] forState:UIControlStateNormal];
        [_left setImage:[UIImage imageNamed: @"boy_button.png"] forState:UIControlStateNormal];
    }
}
*/
@end
