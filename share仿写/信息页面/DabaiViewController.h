//
//  DabaiViewController.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/23.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DabaiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
