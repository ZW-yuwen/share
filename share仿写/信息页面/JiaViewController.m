//
//  JiaViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "JiaViewController.h"
#import "JiaTableViewCell.h"

@interface JiaViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation JiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SHARE";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 820) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[JiaTableViewCell class] forCellReuseIdentifier:@"101"];
    [_tableView registerClass:[JiaTableViewCell class] forCellReuseIdentifier:@"102"];
    [_tableView registerClass:[JiaTableViewCell class] forCellReuseIdentifier:@"103"];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 5;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 90;
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        return 250;
    }
    else if(indexPath.row == 2 || indexPath.row == 4){
        return 354;
    }
    else{
        return 230;
    }
}
-(void) returnLast {
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        JiaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"101" forIndexPath:indexPath];
        cell.picSelf.image = [UIImage imageNamed:@"works_head.png"];
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        JiaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"102" forIndexPath:indexPath];
        cell.lbPic.text = @"多希望列车能把我带到有你的城市。";
        cell.lbPic.font = [UIFont systemFontOfSize:14];
        cell.lbPic.frame = CGRectMake(10, 10, 300, 10);
        
        cell.pic.image = [UIImage imageNamed:@"works_img1.png"];
        cell.pic.frame = CGRectMake(10, 30, 394, 210);
        
        return cell;
    }
    else if(indexPath.row == 1){
        JiaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"103" forIndexPath:indexPath];
        cell.pic.image = [UIImage imageNamed:@"works_img2.png"];
        cell.pic.frame = CGRectMake(10, 10, 394, 210);
        return cell;
    }
    else if(indexPath.row == 2){
        JiaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"103" forIndexPath:indexPath];
        cell.pic.image = [UIImage imageNamed:@"works_img3.png"];
        cell.pic.frame = CGRectMake(105, 10, 210, 334);
        return cell;
    }
    else if(indexPath.row == 3){
        JiaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"103" forIndexPath:indexPath];
        cell.pic.image = [UIImage imageNamed:@"works_img4.png"];
        cell.pic.frame = CGRectMake(10, 10, 394, 210);
        return cell;
    }
    else{
        JiaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"103" forIndexPath:indexPath];
        cell.pic.image = [UIImage imageNamed:@"works_img5.png"];
        cell.pic.frame = CGRectMake(105, 10, 210, 334);
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
    return 0;
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
