//
//  LoginViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/20.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "ActivityViewController.h"
#import "SelfViewController.h"
#import "SearchViewController.h"
#import "WriteViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *background = [UIImage imageNamed:@"kaiji1.png"];
    self.view.layer.contents = (id)background.CGImage;
    
    UIImageView *shareLogo = [[UIImageView alloc]initWithFrame:CGRectMake(140, 100, 140, 140)];
    shareLogo.image = [UIImage imageNamed:@"kaiji_logo.psd"];
    [self.view addSubview:shareLogo];
    
    UILabel *share = [[UILabel alloc]initWithFrame:CGRectMake(130, 230, 200, 90)];
    share.text = @"SHARE";
    share.textColor = [UIColor whiteColor];
    share.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:share];
    
    _login = [[UITextField alloc]initWithFrame:CGRectMake(40, 380, 330, 50)];
    _password = [[UITextField alloc]initWithFrame:CGRectMake(40, 455, 330, 50)];
    _login.placeholder = @"请输入用户名...";
    _password.placeholder = @"请输入密码...";
    _password.secureTextEntry = YES;
    _login.delegate = self;
    _password.delegate = self;
    
    [self.view addSubview:_login];
    [self.view addSubview:_password];
    [_login setBorderStyle:UITextBorderStyleRoundedRect];
    [_password setBorderStyle:UITextBorderStyleRoundedRect];
    
    UIImageView *loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    loginImage.image = [UIImage imageNamed:@"user_img.png"];
    _login.leftView = loginImage;
    _login.leftViewMode = UITextFieldViewModeAlways;
    loginImage.contentMode = UIViewContentModeCenter;
    
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    passwordImage.image = [UIImage imageNamed:@"pass_img.png"];
    _password.leftView = passwordImage;
    _password.leftViewMode = UITextFieldViewModeAlways;
    passwordImage.contentMode = UIViewContentModeCenter;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardup:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboarddown:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UIButton *btLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btLogin setTintColor:[UIColor whiteColor]];
    [btLogin.layer setMasksToBounds:YES];
    btLogin.layer.borderWidth = 1;
    btLogin.layer.cornerRadius = 10;
    [btLogin.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btLogin setTitle:@"登陆" forState:UIControlStateNormal];
    btLogin.frame = CGRectMake(70, 550, 120, 50);
    [btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btLogin];
    
    UIButton *btPassword = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btPassword setTintColor:[UIColor whiteColor]];
    [btPassword.layer setMasksToBounds:YES];
    btPassword.layer.borderWidth = 1;
    btPassword.layer.cornerRadius = 10;
    [btPassword.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btPassword setTitle:@"注册" forState:UIControlStateNormal];
    btPassword.frame = CGRectMake(220, 550, 120, 50);
    [btPassword addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btPassword];
    
    _zdLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [_zdLogin setImage:[[UIImage imageNamed:@"checkbox_unchecked.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal];
    _zdLogin.frame = CGRectMake(40, 620, 20, 20);
    [_zdLogin addTarget:self action:@selector(pressSelf) forControlEvents:UIControlEventTouchUpInside];
    [_zdLogin setAdjustsImageWhenHighlighted:NO];
    [self.view addSubview:_zdLogin];
    UILabel *lbZd = [[UILabel alloc]initWithFrame:CGRectMake(70, 620, 90, 20)];
    lbZd.text = @"自动登录";
    lbZd.textColor = [UIColor blueColor];
    [self.view addSubview:lbZd];
    
}

-(void) pressRegister{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    registerVC.twoDelegate = self;
    registerVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerVC animated:YES completion:nil];
 //   [self.navigationController pushViewController:registerVC animated:YES];
    
}

-(void)pressLogin{
    if(![_password.text isEqualToString:@"www"]){
        [self showError:@"用户名或密码错误！"];
        return;
    }
    UIWindow *window = self.view.window;
    
    [window makeKeyAndVisible];


    HomeViewController *homeVC = [[HomeViewController alloc]init];
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    WriteViewController *writeVC = [[WriteViewController alloc]init];
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    SelfViewController *selfVC = [[SelfViewController alloc]init];
    
    homeVC.view.backgroundColor = [UIColor whiteColor];
    homeVC.tabBarItem.image = [[UIImage imageNamed:@"56.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    searchVC.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
    searchVC.tabBarItem.image = [[UIImage imageNamed:@"button2_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    writeVC.view.backgroundColor = [UIColor whiteColor];
    writeVC.tabBarItem.image = [[UIImage imageNamed:@"button3_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    activityVC.view.backgroundColor = [UIColor whiteColor];
    activityVC.tabBarItem.image = [[UIImage imageNamed:@"button4_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selfVC.view.backgroundColor = [UIColor whiteColor];
    selfVC.tabBarItem.image = [[UIImage imageNamed:@"button5_normal.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"button1_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [homeNav.navigationBar setBackgroundImage:[[UIImage imageNamed:@"actionbar.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [homeNav.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:24],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    homeNav.navigationBar.translucent = YES;
    
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    searchNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"button2_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [searchNav.navigationBar setBackgroundImage:[[UIImage imageNamed:@"background_main.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [searchNav.navigationBar setTitleTextAttributes:
       @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    searchNav.navigationBar.translucent = NO;
    
    UINavigationController *writeNav = [[UINavigationController alloc] initWithRootViewController:writeVC];
    writeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"button3_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [writeNav.navigationBar setBackgroundImage:[[UIImage imageNamed:@"background_main.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [writeNav.navigationBar setTitleTextAttributes:
       @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    writeNav.navigationBar.translucent = NO;
    
    UINavigationController *activityNav = [[UINavigationController alloc] initWithRootViewController:activityVC];
    activityNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"button4_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [activityNav.navigationBar setBackgroundImage:[[UIImage imageNamed:@"background_main.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [activityNav.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UINavigationController *selfNav = [[UINavigationController alloc] initWithRootViewController:selfVC];
    selfNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"button5_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [selfNav.navigationBar setBackgroundImage:[[UIImage imageNamed:@"background_main.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [selfNav.navigationBar setTitleTextAttributes:
       @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITabBarController *tbController = [[UITabBarController alloc] init];
    tbController.tabBar.translucent = NO;
    tbController.tabBar.barTintColor = [UIColor blackColor];
//    [[UITabBar appearance]setBackgroundColor:[UIColor blackColor]];
    
    NSArray* arrayNav = [NSArray arrayWithObjects:homeNav, searchNav, writeNav, activityNav, selfNav, nil];
    tbController.viewControllers = arrayNav;
    
    window.rootViewController = tbController;
}

- (void)showError:(NSString *)errorMsg {
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
}

-(void) pass:(NSString *)name {
    _login.text = name;
}
-(void) pass02:(NSString *)password{
    _password.text = password;
}

-(void)keyboardup:(NSNotification *)aNSNotification
{
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect = [keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;

    //给self.view添加一个向上移动deltaY的动画
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
    }];
     
}
-(void)keyboarddown:(NSNotification *)notification{
    
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void) pressSelf{
    _zdLogin.selected = !_zdLogin.selected;
    if (_zdLogin.selected) {
         [_zdLogin setImage:[[UIImage imageNamed:@"checkbox_checked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateSelected];
    }
    else{
        [_zdLogin setImage:[[UIImage imageNamed:@"checkbox_unchecked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
