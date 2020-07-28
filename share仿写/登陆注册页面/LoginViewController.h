//
//  LoginViewController.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/20.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <TwoDelegate>
@property(nonatomic, strong) UIButton *zdLogin;
@property UITextField *login;
@property UITextField *password;

@end
NS_ASSUME_NONNULL_END
