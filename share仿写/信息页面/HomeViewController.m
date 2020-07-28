//
//  HomeViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/21.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "ScrollerTableViewCell.h"
#import "JiaViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"SHARE";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 820) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"01"];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"02"];
    [self.tableView registerClass:[ScrollerTableViewCell class] forCellReuseIdentifier:@"00"];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    return 155;
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ScrollerTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"00" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1) {
        HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"01" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img1.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"假日";
        cell.lbName.text = @"share小白";
        cell.lbName.frame = CGRectMake(305, 15, 90, 30);
        cell.lbSection.text = @"原创-插画-练习习作";
        cell.lbTime.text = @"15分钟前";
        return cell;
    }
    else if(indexPath.section == 2){
        HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"01" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img2.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"国外画册欣赏";
        cell.lbName.text = @"share小王";
        cell.lbSection.text = @"平面设计-画册设计";
        cell.lbTime.text = @"16分钟前";
        return cell;
    }
    else if(indexPath.section == 3){
        HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"02" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img3.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"collection扁平设计";
        cell.lbName.text = @"share小吕";
        cell.lbSection.text = @"平面设计-海报设计";
        cell.lbTime.text = @"17分钟前";
        return cell;
    }
    else{
        HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"02" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img4.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"版本整理术：高效解决多风格要求";
        cell.lbTitle.frame = CGRectMake(225, 10, 200, 60);
        //自动换行
        cell.lbTitle.lineBreakMode = UILineBreakModeWordWrap;
        cell.lbTitle.numberOfLines = 0;
        cell.lbName.text = @"share小姜";
        cell.lbName.frame = CGRectMake(305, 75, 90, 30);
        cell.lbSection.text = @"平面设计-海报设计";
        cell.lbTime.text = @"20分钟前";
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        JiaViewController *HolidayVC = [[JiaViewController alloc]init];
        [self.navigationController pushViewController:HolidayVC animated:YES];
    }
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
