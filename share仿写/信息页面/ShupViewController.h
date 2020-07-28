//
//  ShupViewController.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/26.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShupViewController : UIViewController

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *strArr;
@property(nonatomic, strong)NSMutableString *str;
@property UIButton *selectButton;
@property NSNumber *num;

@end

NS_ASSUME_NONNULL_END
