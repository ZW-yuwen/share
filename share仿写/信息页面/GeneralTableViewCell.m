//
//  GeneralTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GeneralTableViewCell.h"

@implementation GeneralTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _lbName = [[UILabel alloc]initWithFrame:CGRectMake(45, 15, 100, 20)];
    [self.contentView addSubview:_lbName];

    _pic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img3.png"]];
    [self.contentView addSubview:_pic];
    
    return self;
}

-(void)layoutSubviews{
    _pic.frame = CGRectMake(350, 15, 20, 20);
}

@end
