//
//  GeneralViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GeneralViewController.h"
#import "GeneralTableViewCell.h"
#import "GninforViewController.h"
#import "GnpassViewController.h"
#import "GnnewViewController.h"

@interface GeneralViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation GeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
            // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[GeneralTableViewCell class] forCellReuseIdentifier:@"551"];
        
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
        GeneralTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"551" forIndexPath:indexPath];
        cell.lbName.text = @"基本资料";
        return cell;
    }
    else if (indexPath.row == 1){
        GeneralTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"551" forIndexPath:indexPath];
        cell.lbName.text = @"修改密码";
        return cell;
    }
    else if (indexPath.row == 2){
        GeneralTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"551" forIndexPath:indexPath];
        cell.lbName.text = @"消息设置";
        return cell;
    }
    else if (indexPath.row == 3){
        GeneralTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"551" forIndexPath:indexPath];
        cell.lbName.text = @"关于share";
        return cell;
    }
    else{
        GeneralTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"551" forIndexPath:indexPath];
        cell.lbName.text = @"清除缓存";
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        GninforViewController *inforVC = [[GninforViewController alloc]init];
        [self.navigationController pushViewController:inforVC animated:YES];
    }
    else if(indexPath.row == 1){
        GnpassViewController *passVC = [[GnpassViewController alloc]init];
        [self.navigationController pushViewController:passVC animated:YES];
    }
    else if (indexPath.row == 2){
        GnnewViewController *newVC = [[GnnewViewController alloc]init];
        [self.navigationController pushViewController:newVC animated:YES];
    }
    else if(indexPath.row == 3){
        [self showError:@"目前没有新内容！"];
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"缓存已清除" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
        [self performSelector:@selector(next) withObject:self afterDelay:2];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(void)next{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) returnLast {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)showError:(NSString *)message{
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
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
