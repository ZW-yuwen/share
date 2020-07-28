//
//  SelfTableViewCell.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/23.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelfTableViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView *pic;
@property(nonatomic, strong)UILabel *lbName;
@property(nonatomic, strong)UILabel *lbSection;
@property(nonatomic, strong)UILabel *lbTag;
@property(nonatomic, strong)UILabel *lbShare;
@property(nonatomic, strong)UILabel *lblove;
@property(nonatomic, strong)UILabel *lbSee;
@property(nonatomic, strong)UIButton *btShare;
@property(nonatomic, strong)UIButton *btlove;
@property(nonatomic, strong)UIButton *btSee;


@end

NS_ASSUME_NONNULL_END
