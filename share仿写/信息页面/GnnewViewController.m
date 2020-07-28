//
//  GnnewViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GnnewViewController.h"
#import "GnnewTableViewCell.h"

@interface GnnewViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation GnnewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.title = @"消息设置";
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerClass:[GnnewTableViewCell class] forCellReuseIdentifier:@"555"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GnnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"555" forIndexPath:indexPath];
    NSArray *nameArr = @[@"接受所有新消息通知", @"通知显示栏", @"声音", @"振动", @"关注更新"];
    cell.name.text = nameArr[indexPath.row];
    
    return cell;
    
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
    return 0;
}
-(void) returnLast {
    [self.navigationController popViewControllerAnimated:YES];
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
