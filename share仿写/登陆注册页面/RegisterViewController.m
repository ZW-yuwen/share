//
//  RegisterViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/20.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *background = [UIImage imageNamed:@"kaiji1.png"];
    self.view.layer.contents = (id)background.CGImage;
    
    UIImageView *shareLogo = [[UIImageView alloc]initWithFrame:CGRectMake(140, 90, 140, 140)];
    shareLogo.image = [UIImage imageNamed:@"kaiji_logo.psd"];
    [self.view addSubview:shareLogo];
    
    UILabel *share = [[UILabel alloc]initWithFrame:CGRectMake(140, 220, 200, 90)];
    share.text = @"SHARE";
    share.textColor = [UIColor whiteColor];
    share.font = [UIFont systemFontOfSize:45];
    [self.view addSubview:share];
    
    _email = [[UITextField alloc]initWithFrame:CGRectMake(40, 360, 330, 50)];
    _user = [[UITextField alloc]initWithFrame:CGRectMake(40, 435, 330, 50)];
    _passWord = [[UITextField alloc]initWithFrame:CGRectMake(40, 510, 330, 50)];
    _user.placeholder = @"请输入用户名...";
    _passWord.placeholder = @"请输入密码...";
    _email.placeholder = @"请输入邮箱...";
    _passWord.secureTextEntry = YES;
    _user.delegate = self;
    _passWord.delegate = self;
    _email.delegate = self;
    
    UIImageView *emailImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    emailImage.image = [UIImage imageNamed:@"email_img.png"];
    _email.leftView = emailImage;
    _email.leftViewMode = UITextFieldViewModeAlways;
    emailImage.contentMode = UIViewContentModeCenter;
    
    UIImageView *loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    loginImage.image = [UIImage imageNamed:@"user_img.png"];
    _user.leftView = loginImage;
    _user.leftViewMode = UITextFieldViewModeAlways;
    loginImage.contentMode = UIViewContentModeCenter;
    
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    passwordImage.image = [UIImage imageNamed:@"pass_img.png"];
    _passWord.leftView = passwordImage;
    _passWord.leftViewMode = UITextFieldViewModeAlways;
    passwordImage.contentMode = UIViewContentModeCenter;
    
    [self.view addSubview:_email];
    [self.view addSubview:_user];
    [self.view addSubview:_passWord];
    [_user setBorderStyle:UITextBorderStyleRoundedRect];
    [_passWord setBorderStyle:UITextBorderStyleRoundedRect];
    [_email setBorderStyle:UITextBorderStyleRoundedRect];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardup:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboarddown:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UIButton *btLog = [UIButton buttonWithType:UIButtonTypeCustom];
    [btLog setTintColor:[UIColor whiteColor]];
    [btLog.layer setMasksToBounds:YES];
    btLog.layer.borderWidth = 1;
    btLog.layer.cornerRadius = 10;
    [btLog setTitle:@"确认注册" forState:UIControlStateNormal];
    [btLog.layer setBorderColor:[UIColor whiteColor].CGColor];
    btLog.frame = CGRectMake(100, 590, 180, 50);
    [self.view addSubview:btLog];
    [btLog addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
/*    UIButton *btPassword = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btPassword setTintColor:[UIColor whiteColor]];
    [btPassword.layer setMasksToBounds:YES];
    btPassword.layer.borderWidth = 1;
    btPassword.layer.cornerRadius = 10;
    [btPassword.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btPassword setTitle:@"注册" forState:UIControlStateNormal];
    btPassword.frame = CGRectMake(220, 550, 120, 50);
    [btPassword addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btPassword];*/


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

-(void) pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
    if([_twoDelegate respondsToSelector:@selector(pass:)]){
        [_twoDelegate pass:_user.text];
    }
    if([_twoDelegate respondsToSelector:@selector(pass02:)]){
        [_twoDelegate pass02:_passWord.text];
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
