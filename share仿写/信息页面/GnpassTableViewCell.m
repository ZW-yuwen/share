//
//  GnpassTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GnpassTableViewCell.h"

@implementation GnpassTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(35, 10, 80, 20)];
    [self.contentView addSubview:_name];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(140, 10, 200, 20)];
    
    [self.contentView addSubview:_password];
    
    return self;
}
-(void)layoutSubviews{
    
    _password.keyboardType = UIKeyboardTypeDefault;

    
}

@end
