//
//  SelfViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/21.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "SelfViewController.h"
#import "SelfTableViewCell.h"
#import "UpdateViewController.h"
#import "MessageViewController.h"
#import "TuiViewController.h"
#import "GeneralViewController.h"

@interface SelfViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人信息";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 820) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[SelfTableViewCell class] forCellReuseIdentifier:@"501"];
    [self.tableView registerClass:[SelfTableViewCell class] forCellReuseIdentifier:@"502"];
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 160;
    }
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SelfTableViewCell *cell01 = [self.tableView dequeueReusableCellWithIdentifier:@"501" forIndexPath:indexPath];
        return cell01;
    }
    else{
        SelfTableViewCell *cell02 = [self.tableView dequeueReusableCellWithIdentifier:@"502" forIndexPath:indexPath];
        NSArray *tag = @[@"img2.png", @"img4.png", @"button_zan.png", @"img5.png", @"img6.png", @"img7.png"];
        cell02.pic.image = [UIImage imageNamed:tag[indexPath.row]];
        
        NSArray *text = @[@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出"];
        cell02.lbName.text = text[indexPath.row];
        return cell02;
    }
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
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        UpdateViewController *upDateVC = [[UpdateViewController alloc]init];
        [self.navigationController pushViewController:upDateVC animated:YES];
    }
    else if(indexPath.row == 1){
        MessageViewController *messageVC = [[MessageViewController alloc]init];
        [self.navigationController pushViewController:messageVC animated:YES];
    }
    else if(indexPath.row == 2){
        TuiViewController *tuiVC = [[TuiViewController alloc]init];
        [self.navigationController pushViewController:tuiVC animated:YES];
    }
    else if(indexPath.row == 4){
        GeneralViewController *generalVC = [[GeneralViewController alloc]init];
        [self.navigationController pushViewController:generalVC animated:YES];
    }
    else if(indexPath.section == 0){
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        return ;
    }
    else{
       [self showError:@"当前没有新内容！"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
