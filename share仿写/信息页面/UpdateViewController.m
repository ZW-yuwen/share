//
//  UpdateViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/24.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "UpdateViewController.h"
#import "UpTableViewCell.h"

@interface UpdateViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我上传的";
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
        // Do any additional setup after loading the view.
    NSArray *array = [NSArray arrayWithObjects:@"上传时间",@"推荐最多",@"分享最多", nil];
        //初始化UISegmentedControl
    _controller = [[UISegmentedControl alloc]initWithItems:array];
    [self.view addSubview:_controller];
        
        //根据内容定分段宽度
    _controller.apportionsSegmentWidthsByContent = YES;
        //开始时默认选中下标(第一个下标默认是0)
    _controller.selectedSegmentIndex = 0;
        //控件渲染色(也就是外观字体颜色)
    //    _controller.tintColor = [UIColor whiteColor];
    _controller.selectedSegmentTintColor = [UIColor grayColor];
    _controller.backgroundColor = [UIColor colorWithRed:0.43 green:0.43 blue:0.43 alpha:0.9];
        //设置未选中的字体颜色
    [_controller setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    _controller.frame = CGRectMake(-10, 85, 454, 40);
    [_controller addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
        //设置选中的字体颜色
     //   [_controller setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:1.03 green:1.02 blue:1.03 alpha:0]} forState:UIControlStateSelected];
        // 设置指定索引选项的宽度(设置下标为2的分段宽度)
    [_controller setWidth:138 forSegmentAtIndex:0];
    [_controller setWidth:138 forSegmentAtIndex:1];
    [_controller setWidth:138 forSegmentAtIndex:2];
        
    _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 125, 414, 700)];
    [self.view addSubview:_scroller];
    _scroller.bounces = NO;
    _scroller.userInteractionEnabled = YES;
    _scroller.contentSize = CGSizeMake(414 * 3, 600);
    _scroller.pagingEnabled = YES;
    _scroller.delegate = self;
        
        
    self.tableView01 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 690) style:UITableViewStylePlain];
    [self.scroller addSubview:self.tableView01];
    self.tableView01.dataSource = self;
    self.tableView01.delegate = self;
    [self.tableView01 registerClass:[UpTableViewCell class] forCellReuseIdentifier:@"01"];
    self.tableView01.tag = 51;
        
    self.tableView02 = [[UITableView alloc] initWithFrame:CGRectMake(414, 0, 414, 690) style:UITableViewStylePlain];
    [self.scroller addSubview:self.tableView02];
    self.tableView02.dataSource = self;
    self.tableView02.delegate = self;
    [self.tableView02 registerClass:[UpTableViewCell class] forCellReuseIdentifier:@"02"];
    self.tableView02.tag = 52;

    self.tableView03 = [[UITableView alloc] initWithFrame:CGRectMake(828, 0, 414, 690) style:UITableViewStylePlain];
    [self.scroller addSubview:self.tableView03];
    self.tableView03.dataSource = self;
    self.tableView03.delegate = self;
    [self.tableView03 registerClass:[UpTableViewCell class] forCellReuseIdentifier:@"03"];
    self.tableView03.tag = 53;
    
}
-(void) change:(UISegmentedControl *)controller{
    if(controller.selectedSegmentIndex == 0){
        [self.scroller setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (controller.selectedSegmentIndex == 1) {
        [self.scroller setContentOffset:CGPointMake(414, 0) animated:YES];
    }
    if (controller.selectedSegmentIndex == 2) {
        [self.scroller setContentOffset:CGPointMake(828, 0) animated:YES];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scroller.contentOffset.x == 0) {
        _controller.selectedSegmentIndex = 0;
    }
    if (self.scroller.contentOffset.x == 414) {
        _controller.selectedSegmentIndex = 1;
    }
    if (self.scroller.contentOffset.x == 828) {
        _controller.selectedSegmentIndex = 2;
    }
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 51) {
        UpTableViewCell *cell01 = [self.tableView01 dequeueReusableCellWithIdentifier:@"01" forIndexPath:indexPath];
        
        NSArray *titileArr1 = @[@"诗", @"晚安", @"繁繁", @"我们之间", @"生如夏花"];
        NSArray *nameArr1 = @[@"share屿彣", @"share小高", @"shareKK", @"share小桃", @"share小韩"];
        NSArray *timeArr1 = @[@"4分钟前", @"17分钟前", @"55分钟前", @"1小时前", @"3小时前", @"6小时前"];
        NSArray *imageArr1 = @[@"up01.JPG", @"up02.JPG", @"up03.JPG", @"up04.JPG", @"up05.JPG"];
        NSArray *lineArr1 = @[@"山川异域 风月同天", @"热爱可抵岁月漫长", @"心里藏着小星星", @"同频才能共振", @"我从远方赶来"];
        

        cell01.picture.image = [UIImage imageNamed: imageArr1[indexPath.section]];
        cell01.lbTitle.text = titileArr1[indexPath.section];
        cell01.lbName.text = nameArr1[indexPath.section];
        cell01.lbLine.text = lineArr1[indexPath.section];
        cell01.lbTime.text = timeArr1[indexPath.section];
        
        return cell01;
    }
    else if(tableView.tag == 52){
        UpTableViewCell *cell02 = [self.tableView02 dequeueReusableCellWithIdentifier:@"02" forIndexPath:indexPath];
        NSArray *titileArr2 = @[@"生如夏花", @"月", @"汀南", @"晚安", @"我们之间"];
        NSArray *nameArr2 = @[@"share小桃", @"shareMIMO", @"share小林", @"share珂珂", @"share小笙"];
        NSArray *lineArr2 = @[@"我从远方赶来", @"心里藏着小星星", @"热爱可抵岁月漫长", @"山川异域 风月同天", @"同频才能共振"];
        NSArray *timeArr2 = @[@"刚刚", @"3分钟前", @"11分钟前", @"22分钟前", @"1小时前", @"37分钟前"];
        NSArray *imageArr2 = @[@"up03.JPG",@"up04.JPG", @"up02.JPG", @"up06.JPG", @"up01.JPG"];
        
        cell02.picture.image = [UIImage imageNamed: imageArr2[indexPath.section]];
        cell02.lbTitle.text = titileArr2[indexPath.section];
        cell02.lbName.text = nameArr2[indexPath.section];
        cell02.lbLine.text = lineArr2[indexPath.section];
        cell02.lbTime.text = timeArr2[indexPath.section];
        return cell02;
    }
    else{
        UpTableViewCell *cell03 = [self.tableView03 dequeueReusableCellWithIdentifier:@"03" forIndexPath:indexPath];
        
        NSArray *titileArr3 = @[@"新世界", @"duck的学问", @"如期而至", @"夏天的风", @"鲸落"];
        
        NSArray *nameArr3 = @[@"share花花", @"share小范", @"share小刘", @"share小王", @"share洛洛"];
        NSArray *timeArr3 = @[@"17分钟前", @"31分钟前", @"39分钟前", @"57分钟前", @"2小时前", @"37分钟前"];
        NSArray *imageArr3 = @[@"文章故事.JPG", @"文章duck.JPG", @"文章如期.JPG", @"文章风.JPG",  @"文章船.JPG"];
        NSArray *lineArr3 = @[@"好想爱这个世界啊", @"心里藏着小星星", @"热爱可抵岁月漫长", @"山川异域 风月同天", @"同频才能共振"];
        
        cell03.picture.image = [UIImage imageNamed: imageArr3[indexPath.section]];
        cell03.lbTitle.text = titileArr3[indexPath.section];
        cell03.lbLine.text = lineArr3[indexPath.section];
        cell03.lbName.text = nameArr3[indexPath.section];
        cell03.lbTime.text = timeArr3[indexPath.section];
        return cell03;
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
    return 5;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
