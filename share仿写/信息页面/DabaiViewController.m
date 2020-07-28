//
//  DabaiViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/23.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "DabaiViewController.h"
#import "DabaiTableViewCell.h"

@interface DabaiViewController ()

@end

@implementation DabaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
    
    UITextField *tfTop = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, 390, 30)];
    tfTop.text = @"大白";
    tfTop.backgroundColor = [UIColor whiteColor];
    [tfTop setBorderStyle:UITextBorderStyleRoundedRect];
    
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 20, 15)];
    leftImage.image = [UIImage imageNamed:@"搜索.png"];
    tfTop.leftView = leftImage;
    tfTop.leftViewMode = UITextFieldViewModeAlways;
    leftImage.contentMode = UIViewContentModeCenter;
    [self.view addSubview:tfTop];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, 414, 820) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerClass:[DabaiTableViewCell class] forCellReuseIdentifier:@"bai01"];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        DabaiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"bai01" forIndexPath:indexPath];
        UIImage *imagePic = [UIImage imageNamed:@"bai01.JPG"];
        cell.picture.image = imagePic;
        cell.lbTitle.text = @"Icon of Baymax";
        cell.lbName.text = @"share小白";
        cell.lbSection.text = @"原创-UI-icon";
        cell.lbTime.text = @"15分钟前";
        return cell;
    }
    else{
        DabaiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"bai01" forIndexPath:indexPath];
        UIImage *imagePic = [UIImage imageNamed:@"bai02.JPG"];
        cell.picture.image = imagePic;
        cell.lbTitle.text = @"每个人都需要一个大白";
        cell.lbName.text = @"share小王";
        cell.lbSection.text = @"原创作品-摄影";
        cell.lbTime.text = @"1个月前";
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
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
