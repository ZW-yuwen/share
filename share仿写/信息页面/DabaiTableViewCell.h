//
//  DabaiTableViewCell.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/23.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DabaiTableViewCell : UITableViewCell
@property(nonatomic, strong) UIImageView *picture;
@property(nonatomic, strong) UIButton *btLove;
@property(nonatomic, strong) UIButton *btLook;
@property(nonatomic, strong) UIButton *btShare;
@property(nonatomic, strong) UILabel *lbLove;
@property(nonatomic, strong) UILabel *lbLook;
@property(nonatomic, strong) UILabel *lbShare;
@property(nonatomic, strong) UILabel *lbTitle;
@property(nonatomic, strong) UILabel *lbSection;
@property(nonatomic, strong) UILabel *lbTime;
@property(nonatomic, strong) UILabel *lbName;
@end

NS_ASSUME_NONNULL_END
