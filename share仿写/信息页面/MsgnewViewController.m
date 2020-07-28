//
//  MsgnewViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "MsgnewViewController.h"
#import "MsgnewTableViewCell.h"

@interface MsgnewViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MsgnewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"新关注的";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 800) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[MsgnewTableViewCell class] forCellReuseIdentifier:@"523"];
    
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MsgnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"523" forIndexPath:indexPath];
        cell.picture.image = [UIImage imageNamed: @"works_head.png"];
        cell.name.text = @"share小格";
        return cell;
    }
    else if (indexPath.row == 1){
        MsgnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"523" forIndexPath:indexPath];
        cell.picture.image = [UIImage imageNamed:@"sixin_img2.png"];
        cell.name.text = @"share小兰";
        return cell;
    }
    else if (indexPath.row == 2){
        MsgnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"523" forIndexPath:indexPath];
        cell.picture.image = [UIImage imageNamed:@"sixin_img3.png"];
        cell.name.text = @"share卡卡";
        return cell;
    }
    else if (indexPath.row == 3){
        MsgnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"523" forIndexPath:indexPath];
        cell.picture.image = [UIImage imageNamed:@"guanzhu_img5.png"];
        cell.name.text = @"share小雪";
        
        return cell;
    }
    else if (indexPath.row == 4){
        MsgnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"523" forIndexPath:indexPath];
        cell.picture.image = [UIImage imageNamed:@"up03.JPG"];
        cell.name.text = @"share萌萌";
        return cell;
    }
    else{
        MsgnewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"523" forIndexPath:indexPath];
        cell.picture.image = [UIImage imageNamed:@"up05.JPG"];
        cell.name.text = @"shareLity";
        return cell;
    }
}
-(void) returnLast {
    [self.navigationController popViewControllerAnimated:YES];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
