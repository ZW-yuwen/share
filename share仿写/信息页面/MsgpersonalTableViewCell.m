//
//  MsgpersonalTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "MsgpersonalTableViewCell.h"

@implementation MsgpersonalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(40, 15, 60, 60)];
    [self.contentView addSubview:_image];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(120, 20, 150, 20)];
    [self.contentView addSubview:_name];
    
    _comment = [[UILabel alloc]initWithFrame:CGRectMake(120, 50, 300, 20)];
    [self.contentView addSubview:_comment];
    
    _time = [[UILabel alloc]initWithFrame:CGRectMake(340, 10, 90, 10)];
    [self.contentView addSubview:_time];
    
    return self;
}
-(void)layoutSubviews{
    _comment.font = [UIFont systemFontOfSize:15];
    _comment.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    _time.textColor = [UIColor grayColor];
    _time.font = [UIFont systemFontOfSize:11];
}

@end
