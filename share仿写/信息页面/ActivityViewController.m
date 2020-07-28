//
//  ActivityViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/21.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActTableViewCell.h"

@interface ActivityViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ActivityViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"活动";

  /*  [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:20],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];*/
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[ActTableViewCell class] forCellReuseIdentifier:@"01"];
    [self.tableView registerClass:[ActTableViewCell class] forCellReuseIdentifier:@"02"];
    [self.tableView registerClass:[ActTableViewCell class] forCellReuseIdentifier:@"03"];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 180;
    }
    return 200;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        ActTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"01" forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 1){
        ActTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"02" forIndexPath:indexPath];
        return cell;
    }
    else{
        ActTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"03" forIndexPath:indexPath];
        return cell;
    }
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
