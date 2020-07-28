//
//  MsgpersonalViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "MsgpersonalViewController.h"
#import "MsgpersonalTableViewCell.h"

@interface MsgpersonalViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MsgpersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"私信";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerClass:[MsgpersonalTableViewCell class] forCellReuseIdentifier:@"001"];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MsgpersonalTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"001" forIndexPath:indexPath];
    NSArray *imageArr = @[@"works_head.png", @"sixin_img2.png", @"sixin_img3.png", @"up03.JPG"];
    NSArray *nameArr = @[@"share小格", @"share小兰", @"share小明", @"share小雪"];
    NSArray *commentArr = @[@"你的作品我很喜欢！", @"谢谢，已关注你", @"为你点赞！", @"你好可以问问你是怎么拍的吗"];
    NSArray *timeArr = @[@"11-03 09:45", @"11-03 10:00", @"11-03 10:23！", @"11-03 11:20"];
    
    cell.image.image = [UIImage imageNamed:imageArr[indexPath.row]];
    cell.name.text = nameArr[indexPath.row];
    cell.comment.text = commentArr[indexPath.row];
    cell.time.text = timeArr[indexPath.row];
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
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
