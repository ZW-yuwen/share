//
//  GninforViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/25.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "GninforViewController.h"
#import "GninforTableViewCell.h"

@interface GninforViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation GninforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.title = @"基本资料";
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[GninforTableViewCell class] forCellReuseIdentifier:@"552"];
    [_tableView registerClass:[GninforTableViewCell class] forCellReuseIdentifier:@"553"];
    [_tableView registerClass:[GninforTableViewCell class] forCellReuseIdentifier:@"554"];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80;
    }
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        GninforTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"552" forIndexPath:indexPath];
        cell.name.text = @"头像";
        cell.pic.image = [UIImage imageNamed:@"works_head.png"];
        return cell;
    }
    else if(indexPath.row == 1){
        GninforTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"553" forIndexPath:indexPath];
        cell.name.text = @"昵称";
        cell.lbName.text = @"share小白";
        return cell;
    }
    else if(indexPath.row == 2){
        GninforTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"553" forIndexPath:indexPath];
        cell.name.text = @"签名";
        cell.lbName.text = @"开心了就笑，不开心了就过会再笑";
        return cell;
    }
    else if(indexPath.row == 4){
        GninforTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"553" forIndexPath:indexPath];
        cell.name.text = @"邮箱";
        cell.lbName.text = @"186####3@qq.com";
        return cell;
    }
    else{
        GninforTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"554" forIndexPath:indexPath];
        cell.name.text = @"性别";
        return cell;
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
    return 2;
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
