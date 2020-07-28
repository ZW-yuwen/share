//
//  UppicCollectionViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/27.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "UppicCollectionViewCell.h"

@implementation UppicCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _btn = [[UIButton alloc] init];
    [self.contentView addSubview:_btn];
    return self;
}

- (void)layoutSubviews {
    _btn.frame = CGRectMake(0, 0, 90, 90);
    _btn.backgroundColor = [UIColor colorWithWhite:0.01 alpha:0.01];
    
}


@end
