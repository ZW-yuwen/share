//
//  WriteViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/21.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "WriteViewController.h"
#import "WriteTableViewCell.h"

@interface WriteViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"文章";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //先生成存放标题的数据
    NSArray *array = [NSArray arrayWithObjects:@"精选文章",@"热门推荐",@"全部文章", nil];
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
    _controller.frame = CGRectMake(-10, 0, 454, 40);
    [_controller addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    //设置选中的字体颜色
 //   [_controller setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:1.03 green:1.02 blue:1.03 alpha:0]} forState:UIControlStateSelected];
    // 设置指定索引选项的宽度(设置下标为2的分段宽度)
    [_controller setWidth:138 forSegmentAtIndex:0];
    [_controller setWidth:138 forSegmentAtIndex:1];
    [_controller setWidth:138 forSegmentAtIndex:2];
    
    _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, 414, 700)];
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
    [self.tableView01 registerClass:[WriteTableViewCell class] forCellReuseIdentifier:@"01"];
    self.tableView01.tag = 01;
    
    self.tableView02 = [[UITableView alloc] initWithFrame:CGRectMake(414, 0, 414, 690) style:UITableViewStylePlain];
    [self.scroller addSubview:self.tableView02];
    self.tableView02.dataSource = self;
    self.tableView02.delegate = self;
    [self.tableView02 registerClass:[WriteTableViewCell class] forCellReuseIdentifier:@"02"];
    self.tableView02.tag = 02;

    self.tableView03 = [[UITableView alloc] initWithFrame:CGRectMake(828, 0, 414, 690) style:UITableViewStylePlain];
    [self.scroller addSubview:self.tableView03];
    self.tableView03.dataSource = self;
    self.tableView03.delegate = self;
    [self.tableView03 registerClass:[WriteTableViewCell class] forCellReuseIdentifier:@"03"];
    self.tableView03.tag = 03;
    
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
    if (tableView.tag == 01) {
        WriteTableViewCell *cell01 = [self.tableView01 dequeueReusableCellWithIdentifier:@"01" forIndexPath:indexPath];
        
        NSArray *titileArr1 = @[@"昼夜船", @"duck的学问", @"你的故事", @"夏天的风", @"如期而至"];
        NSArray *nameArr1 = @[@"share小刘", @"share小王", @"share洛洛", @"sharePAN", @"share小白"];
        NSArray *timeArr1 = @[@"刚刚", @"8分钟前", @"13分钟前", @"19分钟前", @"23分钟前", @"37分钟前"];
        NSArray *imageArr1 = @[@"文章船.JPG", @"文章duck.JPG", @"文章故事.JPG", @"文章风.JPG", @"文章如期.JPG"];
        
        cell01.picture.image = [UIImage imageNamed: imageArr1[indexPath.section]];
        cell01.lbTitle.text = titileArr1[indexPath.section];
        cell01.lbName.text = nameArr1[indexPath.section];
        cell01.lbTime.text = timeArr1[indexPath.section];
        
        return cell01;
    }
    else if(tableView.tag == 02){
        WriteTableViewCell *cell02 = [self.tableView02 dequeueReusableCellWithIdentifier:@"02" forIndexPath:indexPath];
        NSArray *titileArr2 = @[@"夏天的风", @"如期而至", @"昼夜船", @"duck的学问", @"你的故事"];
        NSArray *nameArr2 = @[@"share姜姜", @"share卡卡", @"share小刘", @"share小张", @"share洛洛"];
        NSArray *timeArr2 = @[@"刚刚", @"3分钟前", @"11分钟前", @"22分钟前", @"1小时前", @"37分钟前"];
        NSArray *imageArr2 = @[@"文章风.JPG",@"文章如期.JPG", @"文章船.JPG", @"文章duck.JPG", @"文章故事.JPG"];
        
        cell02.picture.image = [UIImage imageNamed: imageArr2[indexPath.section]];
        cell02.lbTitle.text = titileArr2[indexPath.section];
        cell02.lbName.text = nameArr2[indexPath.section];
        cell02.lbTime.text = timeArr2[indexPath.section];
        return cell02;
    }
    else{
        WriteTableViewCell *cell03 = [self.tableView03 dequeueReusableCellWithIdentifier:@"03" forIndexPath:indexPath];
        
        NSArray *titileArr3 = @[@"你的故事", @"duck的学问", @"如期而至", @"夏天的风", @"鲸落"];
        NSArray *nameArr3 = @[@"share小樱", @"share小范", @"share小刘", @"share小王", @"share洛洛"];
        NSArray *timeArr3 = @[@"17分钟前", @"31分钟前", @"39分钟前", @"57分钟前", @"2小时前", @"37分钟前"];
        NSArray *imageArr3 = @[@"文章故事.JPG", @"文章duck.JPG", @"文章如期.JPG", @"文章风.JPG",  @"文章船.JPG"];
        
        cell03.picture.image = [UIImage imageNamed: imageArr3[indexPath.section]];
        cell03.lbTitle.text = titileArr3[indexPath.section];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
