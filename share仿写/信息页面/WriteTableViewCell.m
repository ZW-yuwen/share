//
//  WriteTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/23.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "WriteTableViewCell.h"

@implementation WriteTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _picture = [[UIImageView alloc]init];
    [self.contentView addSubview:_picture];
    
    _lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(190, 20, 150, 30)];
    [self.contentView addSubview:_lbTitle];
    
    _lbName = [[UILabel alloc]initWithFrame:CGRectMake(190, 50, 100, 30)];
    [self.contentView addSubview:_lbName];
    
    _lbTime = [[UILabel alloc]initWithFrame:CGRectMake(190, 85, 90, 15)];
    [self.contentView addSubview:_lbTime];
    
    _btLove = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_btLove];
    
    _btLook = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_btLook];
    
    _btShare = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_btShare];
    
    _lbLove = [[UILabel alloc]initWithFrame:CGRectMake(213, 125, 30, 15)];
    [self.contentView addSubview:_lbLove];
    _lbLove.text = @"99";
    
    _lbLook = [[UILabel alloc]initWithFrame:CGRectMake(277, 125, 30, 15)];
    [self.contentView addSubview:_lbLook];
    _lbLook.text = @"17";
    
    _lbShare = [[UILabel alloc]initWithFrame:CGRectMake(333, 125, 30, 15)];
    [self.contentView addSubview:_lbShare];
    _lbShare.text = @"13";

    [_btLove addTarget:self action:@selector(pressOne) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}
-(void) layoutSubviews{
    _picture.frame = CGRectMake(0, 0, 155, 155);
    
    _lbTitle.font = [UIFont systemFontOfSize:20];
    
    _lbTime.font = [UIFont systemFontOfSize:13];
    
    _btLove.frame = CGRectMake(190, 120, 20, 20);
    [_btLove setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    
    _lbLove.font = [UIFont systemFontOfSize:12];
    _lbLove.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    _btLook.frame = CGRectMake(250, 125, 25, 15);
    [_btLook setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    _lbLook.font = [UIFont systemFontOfSize:12];
    _lbLook.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    _btShare.frame = CGRectMake(310, 125, 20, 15);
    [_btShare setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    
    _lbShare.font = [UIFont systemFontOfSize:12];
    _lbShare.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
}


-(void) pressOne{
    if (_btLove.selected == NO) {
        _btLove.selected = YES;
        _lbLove.text = @"99";
    }
    else{
        _btLove.selected = NO;
        _lbLove.text = @"100";
    }
}
@end
