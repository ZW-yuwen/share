//
//  RegisterViewController.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/20.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol TwoDelegate <NSObject>

- (void)pass:(NSString *)name;
- (void)pass02:(NSString *)password;

@end
@interface RegisterViewController : UIViewController
@property UITextField *email;
@property UITextField *user;
@property UITextField *passWord;

@property id <TwoDelegate> twoDelegate;
@end

NS_ASSUME_NONNULL_END
