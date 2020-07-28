//
//  JiaTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "JiaTableViewCell.h"

@implementation JiaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString: @"101"]) {
        _picSelf = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 70, 70)];
        [self.contentView addSubview:_picSelf];
        
        _lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(125, 10, 150, 30)];
        [self.contentView addSubview:_lbTitle];
        _lbTitle.text = @"假日";
        _lbTitle.font = [UIFont systemFontOfSize:20];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectMake(125, 45, 100, 30)];
        [self.contentView addSubview:_lbName];
        
        _lbTime = [[UILabel alloc]initWithFrame:CGRectMake(350, 20, 90, 15)];
        [self.contentView addSubview:_lbTime];
        
        _btLove = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_btLove];
        
        _btLook = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_btLook];
        
        _btShare = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_btShare];
        
        _lbLove = [[UILabel alloc]initWithFrame:CGRectMake(288, 55, 30, 15)];
        [self.contentView addSubview:_lbLove];
        _lbLove.text = @"102";
        
        _lbLook = [[UILabel alloc]initWithFrame:CGRectMake(345, 55, 30, 15)];
        [self.contentView addSubview:_lbLook];
        _lbLook.text = @"26";
        
        _lbShare = [[UILabel alloc]initWithFrame:CGRectMake(395, 55, 30, 15)];
        [self.contentView addSubview:_lbShare];
        _lbShare.text = @"20";
    }
    else if ([self.reuseIdentifier isEqualToString: @"102"]){
        _lbPic = [[UILabel alloc]init];
        [self.contentView addSubview:_lbPic];
        
        _pic = [[UIImageView alloc]init];
        [self.contentView addSubview:_pic];
    }
    else {
        _pic = [[UIImageView alloc]init];
        [self.contentView addSubview:_pic];
    }
    return self;
}
-(void)layoutSubviews{
    
    _lbName.text = @"share小白";
    
    _lbTime.text = @"15分钟前";
    _lbTime.font = [UIFont systemFontOfSize:14];
    
    _btLove.frame = CGRectMake(265, 50, 20, 20);
    [_btLove setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    
    _lbLove.font = [UIFont systemFontOfSize:12];
    _lbLove.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    _btLook.frame = CGRectMake(315, 55, 25, 15);
    [_btLook setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    _lbLook.font = [UIFont systemFontOfSize:12];
    _lbLook.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    _btShare.frame = CGRectMake(370, 55, 20, 15);
    [_btShare setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    
    _lbShare.font = [UIFont systemFontOfSize:12];
    _lbShare.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
}
@end
