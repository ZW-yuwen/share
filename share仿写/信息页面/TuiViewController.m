//
//  TuiViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "TuiViewController.h"
#import "TuiTableViewCell.h"

@interface TuiViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我推荐的";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
        // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 820) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[TuiTableViewCell class] forCellReuseIdentifier:@"531"];
    [self.tableView registerClass:[TuiTableViewCell class] forCellReuseIdentifier:@"532"];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
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
        TuiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"531" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img1.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"假日";
        cell.lbName.text = @"share小白";
        cell.lbName.frame = CGRectMake(305, 35, 90, 30);
        cell.lbSection.text = @"原创-插画-练习习作";
        cell.lbTime.text = @"15分钟前";
        return cell;
    }
    else if(indexPath.section == 1){
        TuiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"532" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img2.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"国外画册欣赏";
        cell.lbName.text = @"share小王";
        cell.lbSection.text = @"平面设计-画册设计";
        cell.lbTime.text = @"16分钟前";
        return cell;
    }
    else if(indexPath.section == 2){
        TuiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"532" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"list_img3.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"collection扁平设计";
        cell.lbName.text = @"share小吕";
        cell.lbSection.text = @"平面设计-海报设计";
        cell.lbTime.text = @"17分钟前";
        return cell;
    }
    else if (indexPath.section == 3){
        TuiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"531" forIndexPath:indexPath];
        UIImage *pic = [UIImage imageNamed:@"note_img3.png"];
        cell.picture.image = pic;
        cell.lbTitle.text = @"字体故事";
        cell.lbName.text = @"share小陆";
        cell.lbSection.text = @"设计文章-经验-设计观点";
        cell.lbName.frame = CGRectMake(305, 35, 90, 30);
        cell.lbTime.text = @"45分钟前";
        return cell;
    }
    else{
        TuiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"532" forIndexPath:indexPath];
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
        cell.lbTime.text = @"1小时前";
        return cell;
    }
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
