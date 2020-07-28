//
//  ShupViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/26.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ShupViewController.h"
#import "ShupTableViewCell.h"
#import "UppicViewController.h"

@interface ShupViewController ()<UITableViewDelegate, UITableViewDataSource> {
    UIButton *downLoad;
    BOOL judge;
    UIButton *btnJt;
}

@end

@implementation ShupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(returnLast)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _selectButton.frame = CGRectMake(15, 20, 240, 150);
    [_selectButton setTitle:@"选择图片" forState:UIControlStateNormal];
    _selectButton.tintColor = [UIColor whiteColor];
    _selectButton.backgroundColor = [UIColor grayColor];
    [_selectButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_selectButton];
    
    UIImageView *location = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"位置.png"]];
    location.frame = CGRectMake(270, 70, 35, 35);
    [self.view addSubview:location];
    
    UIButton *btLocation = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btLocation.frame = CGRectMake(310, 80, 100, 20);
    [btLocation setTitle:@"陕西省 西安市" forState:UIControlStateNormal];;
    btLocation.tintColor = [UIColor whiteColor];
    btLocation.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1.0];
    btLocation.layer.cornerRadius = 5;
    [self.view addSubview:btLocation];
    
    UITextField *title = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 390, 30)];
    title.placeholder = @"作品名称";
    [title setBorderStyle:UITextBorderStyleRoundedRect];
    title.keyboardType = UIKeyboardTypeDefault;
    title.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(10, 340, 390, 120)];
    [text setBorderStyle:UITextBorderStyleNone];
    text.keyboardType = UIKeyboardTypeDefault;
    text.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:text];
    
    UILabel *lbText = [[UILabel alloc]initWithFrame:CGRectMake(13, 345, 300, 10)];
    lbText.text = @"请添加作品说明内容......";
    lbText.textColor = [UIColor grayColor];
    [self.view addSubview:lbText];
    
    UIButton *btUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btUp.frame = CGRectMake(10, 470, 390, 50);
    [btUp setTitle:@"发布" forState:UIControlStateNormal];;
    btUp.tintColor = [UIColor whiteColor];
    btUp.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1.0];
    btUp.layer.cornerRadius = 4;
    [btUp addTarget:self action:@selector(pressUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btUp];
    
    downLoad = [UIButton buttonWithType:UIButtonTypeCustom];
    [downLoad setImage:[[UIImage imageNamed:@"checkbox_unchecked.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal];
    downLoad.frame = CGRectMake(10, 530, 20, 20);
    [downLoad addTarget:self action:@selector(pressSelf) forControlEvents:UIControlEventTouchUpInside];
    [downLoad setAdjustsImageWhenHighlighted:NO];
    [self.view addSubview:downLoad];
    UILabel *lbDown = [[UILabel alloc]initWithFrame:CGRectMake(35, 530, 90, 20)];
    lbDown.text = @"禁止下载";
    lbDown.textColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1.0];
    [self.view addSubview:lbDown];
    
    UIButton *bt0101 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0101];
    bt0101.frame = CGRectMake(10, 230, 91, 20);
    bt0101.tintColor = [UIColor blackColor];
    bt0101.layer.cornerRadius = 5;
    bt0101.backgroundColor = [UIColor whiteColor];
    [bt0101 setTitle:@"平面设计" forState:UIControlStateNormal];
    [bt0101 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0102 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0102];
    bt0102.frame = CGRectMake(111, 230, 91, 20);
    bt0102.tintColor = [UIColor blackColor];
    bt0102.layer.cornerRadius = 5;
    bt0102.backgroundColor = [UIColor whiteColor];
    [bt0102 setTitle:@"网页设计" forState:UIControlStateNormal];
    [bt0102 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0103 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0103];
    bt0103.frame = CGRectMake(212, 230, 91, 20);
    bt0103.tintColor = [UIColor blackColor];
    bt0103.layer.cornerRadius = 5;
    bt0103.backgroundColor = [UIColor whiteColor];
    [bt0103 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [bt0103 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0104 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0104];
    bt0104.frame = CGRectMake(313, 230, 91, 20);
    bt0104.tintColor = [UIColor blackColor];
    bt0104.layer.cornerRadius = 5;
    bt0104.backgroundColor = [UIColor whiteColor];
    [bt0104 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [bt0104 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0105 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0105];
    bt0105.frame = CGRectMake(10, 270, 91, 20);
    bt0105.tintColor = [UIColor blackColor];
    bt0105.layer.cornerRadius = 5;
    bt0105.backgroundColor = [UIColor whiteColor];
    [bt0105 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [bt0105 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0106 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0106];
    bt0106.frame = CGRectMake(111, 270, 91, 20);
    bt0106.tintColor = [UIColor blackColor];
    bt0106.layer.cornerRadius = 5;
    bt0106.backgroundColor = [UIColor whiteColor];
    [bt0106 setTitle:@"影视" forState:UIControlStateNormal];
    [bt0106 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0107 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0107];
    bt0107.frame = CGRectMake(212, 270, 91, 20);
    bt0107.tintColor = [UIColor blackColor];
    bt0107.layer.cornerRadius = 5;
    bt0107.backgroundColor = [UIColor whiteColor];
    [bt0107 setTitle:@"摄影" forState:UIControlStateNormal];
    [bt0107 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0108 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0108];
    bt0108.frame = CGRectMake(313, 270, 91, 20);
    bt0108.tintColor = [UIColor blackColor];
    bt0108.layer.cornerRadius = 5;
    bt0108.backgroundColor = [UIColor whiteColor];
    [bt0108 setTitle:@"其他" forState:UIControlStateNormal];
    [bt0108 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    _strArr = [[NSMutableArray alloc]init];
    [_strArr addObject:@"原创作品"];
    [_strArr addObject:@"设计资料"];
    [_strArr addObject:@"设计师观点"];
    [_strArr addObject:@"设计教程"];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(280, 120, 100, 25) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    judge = NO;
    
    [_tableView registerClass:[ShupTableViewCell class] forCellReuseIdentifier:@"211"];
    
    btnJt = [UIButton buttonWithType:UIButtonTypeCustom];
    btnJt.frame = CGRectMake(370, 120, 25, 25);
    [btnJt setImage:[UIImage imageNamed:@"jiantou01.png"] forState:UIControlStateNormal];
    [btnJt addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnJt];
    
}
-(void)pressUp{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"上传成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

-(void)press{
    UppicViewController *uppicVC = [[UppicViewController alloc]init];
    [uppicVC returnText:^(UIImage *imagee){
        self -> _selectButton.frame = CGRectMake(40, 20, 150, 150);
        [self->_selectButton setImage:imagee forState:UIControlStateNormal];
    }];
    [uppicVC returnText2:^(NSNumber *num){
        self -> _num = num;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(135, 0, 15, 15)];
        label.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1.0];
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"%@", self.num];
        
        //[self->_selectButton removeFromSuperview];
        //[self->_iimageView addSubview:label];
        [self->_selectButton addSubview:label];
    }];
    [self.navigationController pushViewController:uppicVC animated:YES];
}

-(void)press:(UIButton *)btn{
    if(judge == NO){
        self.tableView.frame = CGRectMake(280, 120, 100, 100);
        judge = YES;
        [btn setImage:[UIImage imageNamed:@"jiantou.png"] forState:UIControlStateNormal];
            
    } else {
        self.tableView.frame = CGRectMake(280, 120, 100, 25);
        judge = NO;
        [btn setImage:[UIImage imageNamed:@"jiantou01.png"] forState:UIControlStateNormal];
    }
    //刷新tableview数据
    [_tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    _str = [NSMutableString stringWithString:_strArr[indexPath.row]];
    [_strArr insertObject:_str atIndex:0];
    [_strArr removeObjectAtIndex:indexPath.row + 1];
    judge = NO;

    _tableView.frame = CGRectMake(280, 120, 100, 25);
    [btnJt setImage:[UIImage imageNamed:@"jiantou01.png"] forState:UIControlStateNormal];
    [_tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //如果是未打开的，行数为1
    if(judge == NO){
        return 1;
    } else {
        //如果已经打开tableview，行数为4
        return 4;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShupTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"211" forIndexPath:indexPath];
/*    if(!cell){
        ShupTableViewCell *cell = [[ShupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"211"];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    }
*/
    cell.name.text = _strArr[indexPath.row];
    return cell;
}



-(void) pressSelf{
    downLoad.selected = !downLoad.selected;
    if (downLoad.selected) {
         [downLoad setImage:[[UIImage imageNamed:@"checkbox_checked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateSelected];
    }
    else{
        [downLoad setImage:[[UIImage imageNamed:@"checkbox_unchecked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal];
    }
}
-(void) pressDown: (UIButton *)btnDown {
    btnDown.tintColor = [UIColor whiteColor];
    btnDown.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1.0];
    [btnDown addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
     
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
-(void) pressUp: (UIButton *)btnUp{
    btnUp.tintColor = [UIColor blackColor];
    btnUp.backgroundColor = [UIColor whiteColor];
    [btnUp addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
