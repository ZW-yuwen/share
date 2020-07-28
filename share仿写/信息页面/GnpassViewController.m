//
//  GnpassViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GnpassViewController.h"
#import "GnpassTableViewCell.h"

@interface GnpassViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *passwordArr;
}
@end

@implementation GnpassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.title = @"修改密码";
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerClass:[GnpassTableViewCell class] forCellReuseIdentifier:@"554"];
    
    passwordArr = [[NSMutableArray alloc] init];
    
    UIButton *btPut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btPut];
    btPut.frame = CGRectMake(160, 370, 100, 40);
    [btPut setTitle:@"提交" forState:UIControlStateNormal];
    [btPut addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    btPut.titleLabel.font = [UIFont systemFontOfSize:17];
    btPut.tintColor = [UIColor whiteColor];
    btPut.backgroundColor = [UIColor blackColor];
    
}

-(void) press {
    
    NSString *newPassword = passwordArr[1];
    NSString *twicePassword = passwordArr[2];
    
    if ([twicePassword isEqualToString: newPassword]) {
        [self showError:@"修改密码成功！"];
    }
    else{
        [self showError:@"两次输入密码不同！"];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GnpassTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"554" forIndexPath:indexPath];
    NSArray *nameArr = @[@"旧密码", @"新密码", @"确认密码"];
    cell.name.text = nameArr[indexPath.row];
    
    [cell.password addTarget:self action:@selector(textPutin:) forControlEvents:UIControlEventEditingChanged];
    NSArray *passwordArr = @[@"6-20位字母或数字组合", @"6-20位字母或数字组合", @"请再次输入密码"];
    cell.password.placeholder = passwordArr[indexPath.row];
    cell.password.secureTextEntry = YES;
    
    return cell;
    
}

-(void)showError:(NSString *)message{
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
}

-(void)textPutin:(UITextField *)textFiled {
    [passwordArr addObject: textFiled.text];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void) returnLast {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
