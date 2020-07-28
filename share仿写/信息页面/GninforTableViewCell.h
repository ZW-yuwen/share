//
//  GninforTableViewCell.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GninforTableViewCell : UITableViewCell

@property(nonatomic, strong)UILabel *name;
@property(nonatomic, strong)UILabel *lbName;
@property(nonatomic, strong)UIImageView *pic;
@property(nonatomic, strong)UIButton *left;
@property(nonatomic, strong)UIButton *right;
@property(nonatomic, strong)UILabel *sex;
@property BOOL judge;

@end

NS_ASSUME_NONNULL_END
