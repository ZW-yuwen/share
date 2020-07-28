//
//  MessageViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "MessageViewController.h"
#import "MsgTableViewCell.h"
#import "MsgnewViewController.h"
#import "MsgpersonalViewController.h"

@interface MessageViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的信息";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
            // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];;
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MsgTableViewCell class] forCellReuseIdentifier:@"511"];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MsgTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"511" forIndexPath:indexPath];
        cell.lbName.text = @"评论";
        cell.lbNum.text = @"7";
        return cell;
    }
    else if (indexPath.row == 1){
        MsgTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"511" forIndexPath:indexPath];
        cell.lbName.text = @"推荐我的";
        cell.lbNum.text = @"9";
        return cell;
    }
    else if (indexPath.row == 2){
        MsgTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"511" forIndexPath:indexPath];
        cell.lbName.text = @"新关注的";
        cell.lbNum.text = @"5";
        return cell;
    }
    else if (indexPath.row == 3){
        MsgTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"511" forIndexPath:indexPath];
        cell.lbName.text = @"私信";
        cell.lbNum.text = @"4";
        return cell;
    }
    else{
        MsgTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"511" forIndexPath:indexPath];
        cell.lbName.text = @"活动通知";
        cell.lbNum.text = @"1";
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 4) {
        [self showError:@"目前没有新内容!"];
    }
    else if(indexPath.row == 2){
        MsgnewViewController *msgnewVC = [[MsgnewViewController alloc]init];
        [self.navigationController pushViewController:msgnewVC animated:YES];
    }
    else{
        MsgpersonalViewController *msgperVC = [[MsgpersonalViewController alloc]init];
        [self.navigationController pushViewController:msgperVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)showError:(NSString *)message{
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
}

-(void) returnLast {
    [self.navigationController popViewControllerAnimated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
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
