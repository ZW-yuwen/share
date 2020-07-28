//
//  MsgpersonalTableViewCell.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MsgpersonalTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView *image;
@property(nonatomic, strong)UILabel *name;
@property(nonatomic, strong)UILabel *time;
@property(nonatomic, strong)UILabel *comment;
@end

NS_ASSUME_NONNULL_END
