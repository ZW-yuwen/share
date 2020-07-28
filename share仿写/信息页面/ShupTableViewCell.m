//
//  ShupTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/26.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ShupTableViewCell.h"

@implementation ShupTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 90, 20)];
    [self.contentView addSubview:_name];
    _name.font = [UIFont systemFontOfSize:13];
    return self;
    
}
@end
