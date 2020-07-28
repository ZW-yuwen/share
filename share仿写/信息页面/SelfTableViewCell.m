//
//  SelfTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/23.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "SelfTableViewCell.h"

@implementation SelfTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"501"]) {
        _pic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"works_head.png"]];
        _pic.frame = CGRectMake(30, 20, 120, 120);
        [self.contentView addSubview:_pic];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectMake(175, 20, 140, 40)];
        _lbName.text = @"share小白";
        _lbName.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_lbName];
        
        _lbSection = [[UILabel alloc] initWithFrame:CGRectMake(175, 55, 100, 20)];
        _lbSection.text = @"数媒/设计爱好者";
        _lbSection.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_lbSection];
        
        _lbTag = [[UILabel alloc] initWithFrame:CGRectMake(175, 90, 270, 20)];
        _lbTag.text = @"开心了就笑，不开心了就过会儿再笑";
        _lbTag.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_lbTag];
        
        _btShare = [UIButton buttonWithType:UIButtonTypeCustom];
        _btShare.frame = CGRectMake(175, 125, 25, 20);
        [_btShare setImage:[UIImage imageNamed:@"img1.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btShare];
        
        _btlove = [UIButton buttonWithType:UIButtonTypeCustom];
        _btlove.frame = CGRectMake(250, 125, 23, 23);
        [_btlove setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btlove];
        
        _btSee = [UIButton buttonWithType:UIButtonTypeCustom];
        _btSee.frame = CGRectMake(325, 127, 30, 20);
        [_btSee setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btSee];
        
        _lblove = [[UILabel alloc]initWithFrame:CGRectMake(280, 135, 30, 10)];
        _lblove.text = @"120";
        _lblove.font = [UIFont systemFontOfSize:14];
        _lblove.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        [self.contentView addSubview:_lblove];
        
        _lbShare = [[UILabel alloc]initWithFrame:CGRectMake(205, 135, 30, 10)];
        _lbShare.text = @"15";
        _lbShare.font = [UIFont systemFontOfSize:14];
        _lbShare.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        [self.contentView addSubview:_lbShare];
        
        _lbSee = [[UILabel alloc]initWithFrame:CGRectMake(360, 135, 30, 10)];
        _lbSee.text = @"89";
        _lbSee.font = [UIFont systemFontOfSize:14];
        _lbSee.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        [self.contentView addSubview:_lbSee];
    }
    else{
        _pic = [[UIImageView alloc]init];
        _pic.frame = CGRectMake(30, 20, 25, 20);
        [self.contentView addSubview:_pic];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 70, 20)];
        [self.contentView addSubview:_lbName];
        
        _btShare = [UIButton buttonWithType:UIButtonTypeCustom];
        _btShare.frame = CGRectMake(350, 25, 20, 20);
        [_btShare setImage:[UIImage imageNamed:@"img3.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btShare];
    }
    return self;
}

-(void)layoutSubviews{
}

@end
