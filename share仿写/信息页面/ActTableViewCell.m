//
//  ActTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/22.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ActTableViewCell.h"

@implementation ActTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"01"]) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, 380, 20)];
        [self.contentView addSubview:_label];
        _label.text = @"下厨也要美美的，从一条围裙开始一六月鲜围裙创意设计大赛";
        _label.font = [UIFont systemFontOfSize:12];
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"活动1.jpg"]];
        [self.contentView addSubview:_image];
    }
    else if ([self.reuseIdentifier isEqualToString:@"02"]){
        _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, 380, 20)];
        [self.contentView addSubview:_label];
        _label.text = @"MIUI主题市场让你的创意改变世界";
        _label.font = [UIFont systemFontOfSize:12];
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"活动2.jpg"]];
        [self.contentView addSubview:_image];
    }
    else if ([self.reuseIdentifier isEqualToString:@"03"]){
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"活动3.jpg"]];
        [self.contentView addSubview:_image];
    }
    return self;
}

-(void) layoutSubviews{
    _image.frame = CGRectMake(10, 0, 390, 180);
}
@end
