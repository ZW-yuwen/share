//
//  SearchViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/21.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "SearchViewController.h"
#import "DabaiViewController.h"
#import "ShupViewController.h"


@interface SearchViewController ()<UITextFieldDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"搜索";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_img.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *btnRight = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"分享.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = btnRight;
    
    _tfsearch = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, 390, 30)];
    _tfsearch.placeholder = @"搜索 用户名 作品分类 文章";
    _tfsearch.delegate = self;
    [_tfsearch setBorderStyle:UITextBorderStyleRoundedRect];
    _tfsearch.keyboardType = UIKeyboardTypeDefault;
    _tfsearch.backgroundColor = [UIColor whiteColor];
    
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 15, 15)];
    leftImage.image = [UIImage imageNamed:@"搜索.png"];
    _tfsearch.leftView = leftImage;
    _tfsearch.leftViewMode = UITextFieldViewModeAlways;
    leftImage.contentMode = UIViewContentModeCenter;
    [self.view addSubview:_tfsearch];
    
    
    UILabel *lb01 = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 75, 30)];
    lb01.text = @"       分类";
    lb01.textColor = [UIColor whiteColor];
    lb01.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [self.view addSubview:lb01];
    UIImageView *imageView01 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_button.png"]];
    imageView01.frame = CGRectMake(15, 85, 20, 20);
    [self.view addSubview:imageView01];
    UILabel *lbDown01 = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, 394, 2)];
    lbDown01.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [self.view addSubview:lbDown01];
    
    UIButton *bt0101 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0101];
    bt0101.frame = CGRectMake(10, 130, 91, 20);
    bt0101.tintColor = [UIColor blackColor];
    bt0101.layer.cornerRadius = 5;
    bt0101.backgroundColor = [UIColor whiteColor];
    [bt0101 setTitle:@"平面设计" forState:UIControlStateNormal];
    [bt0101 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0102 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0102];
    bt0102.frame = CGRectMake(111, 130, 91, 20);
    bt0102.tintColor = [UIColor blackColor];
    bt0102.layer.cornerRadius = 5;
    bt0102.backgroundColor = [UIColor whiteColor];
    [bt0102 setTitle:@"网页设计" forState:UIControlStateNormal];
    [bt0102 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0103 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0103];
    bt0103.frame = CGRectMake(212, 130, 91, 20);
    bt0103.tintColor = [UIColor blackColor];
    bt0103.layer.cornerRadius = 5;
    bt0103.backgroundColor = [UIColor whiteColor];
    [bt0103 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [bt0103 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0104 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0104];
    bt0104.frame = CGRectMake(313, 130, 91, 20);
    bt0104.tintColor = [UIColor blackColor];
    bt0104.layer.cornerRadius = 5;
    bt0104.backgroundColor = [UIColor whiteColor];
    [bt0104 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [bt0104 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0105 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0105];
    bt0105.frame = CGRectMake(10, 170, 91, 20);
    bt0105.tintColor = [UIColor blackColor];
    bt0105.layer.cornerRadius = 5;
    bt0105.backgroundColor = [UIColor whiteColor];
    [bt0105 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [bt0105 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0106 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0106];
    bt0106.frame = CGRectMake(111, 170, 91, 20);
    bt0106.tintColor = [UIColor blackColor];
    bt0106.layer.cornerRadius = 5;
    bt0106.backgroundColor = [UIColor whiteColor];
    [bt0106 setTitle:@"影视" forState:UIControlStateNormal];
    [bt0106 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0107 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0107];
    bt0107.frame = CGRectMake(212, 170, 91, 20);
    bt0107.tintColor = [UIColor blackColor];
    bt0107.layer.cornerRadius = 5;
    bt0107.backgroundColor = [UIColor whiteColor];
    [bt0107 setTitle:@"摄影" forState:UIControlStateNormal];
    [bt0107 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0108 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0108];
    bt0108.frame = CGRectMake(313, 170, 91, 20);
    bt0108.tintColor = [UIColor blackColor];
    bt0108.layer.cornerRadius = 5;
    bt0108.backgroundColor = [UIColor whiteColor];
    [bt0108 setTitle:@"其他" forState:UIControlStateNormal];
    [bt0108 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lb02 = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, 75, 30)];
    lb02.text = @"       推荐";
    lb02.textColor = [UIColor whiteColor];
    lb02.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [self.view addSubview:lb02];
    UIImageView *imageView02 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_button.png"]];
    imageView02.frame = CGRectMake(15, 225, 20, 20);
    [self.view addSubview:imageView02];
    UILabel *lbDown02 = [[UILabel alloc]initWithFrame:CGRectMake(10, 250, 394, 2)];
    lbDown02.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [self.view addSubview:lbDown02];
    
    UIButton *bt0201 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0201];
    bt0201.frame = CGRectMake(10, 270, 91, 20);
    bt0201.tintColor = [UIColor blackColor];
    bt0201.layer.cornerRadius = 5;
    bt0201.backgroundColor = [UIColor whiteColor];
    [bt0201 setTitle:@"人气最高" forState:UIControlStateNormal];
    [bt0201 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0202 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0202];
    bt0202.frame = CGRectMake(111, 270, 91, 20);
    bt0202.tintColor = [UIColor blackColor];
    bt0202.layer.cornerRadius = 5;
    bt0202.backgroundColor = [UIColor whiteColor];
    [bt0202 setTitle:@"收藏最多" forState:UIControlStateNormal];
    [bt0202 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0203 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0203];
    bt0203.frame = CGRectMake(212, 270, 91, 20);
    bt0203.tintColor = [UIColor blackColor];
    bt0203.layer.cornerRadius = 5;
    bt0203.backgroundColor = [UIColor whiteColor];
    [bt0203 setTitle:@"评论最多" forState:UIControlStateNormal];
    [bt0203 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0204 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0204];
    bt0204.frame = CGRectMake(313, 270, 91, 20);
    bt0204.tintColor = [UIColor blackColor];
    bt0204.layer.cornerRadius = 5;
    bt0204.backgroundColor = [UIColor whiteColor];
    [bt0204 setTitle:@"编辑精选" forState:UIControlStateNormal];
    [bt0204 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lb03 = [[UILabel alloc]initWithFrame:CGRectMake(10, 320, 75, 30)];
    lb03.text = @"       时间";
    lb03.textColor = [UIColor whiteColor];
    lb03.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [self.view addSubview:lb03];
    UIImageView *imageView03 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_button.png"]];
    imageView03.frame = CGRectMake(15, 325, 20, 20);
    [self.view addSubview:imageView03];
    UILabel *lbDown03 = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, 394, 2)];
    lbDown03.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [self.view addSubview:lbDown03];
    
    UIButton *bt0301 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0301];
    bt0301.frame = CGRectMake(10, 370, 91, 20);
    bt0301.tintColor = [UIColor blackColor];
    bt0301.layer.cornerRadius = 5;
    bt0301.backgroundColor = [UIColor whiteColor];
    [bt0301 setTitle:@"30分钟前" forState:UIControlStateNormal];
    [bt0301 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0302 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0302];
    bt0302.frame = CGRectMake(111, 370, 91, 20);
    bt0302.tintColor = [UIColor blackColor];
    bt0302.layer.cornerRadius = 5;
    bt0302.backgroundColor = [UIColor whiteColor];
    [bt0302 setTitle:@"1小时前" forState:UIControlStateNormal];
    [bt0302 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0303 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0303];
    bt0303.frame = CGRectMake(212, 370, 91, 20);
    bt0303.tintColor = [UIColor blackColor];
    bt0303.layer.cornerRadius = 5;
    bt0303.backgroundColor = [UIColor whiteColor];
    [bt0303 setTitle:@"1月前" forState:UIControlStateNormal];
    [bt0303 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bt0304 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:bt0304];
    bt0304.frame = CGRectMake(313, 370, 91, 20);
    bt0304.tintColor = [UIColor blackColor];
    bt0304.layer.cornerRadius = 5;
    bt0304.backgroundColor = [UIColor whiteColor];
    [bt0304 setTitle:@"1年前" forState:UIControlStateNormal];
    [bt0304 addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void) pressDown: (UIButton *)btnDown {
    btnDown.tintColor = [UIColor whiteColor];
    btnDown.backgroundColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    [btnDown addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
     
}

-(void) pressUp: (UIButton *)btnUp{
    btnUp.tintColor = [UIColor blackColor];
    btnUp.backgroundColor = [UIColor whiteColor];
    [btnUp addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)pressRight{
    ShupViewController *shupVC = [[ShupViewController alloc]init];
    [self.navigationController pushViewController:shupVC animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([_tfsearch.text isEqualToString: @"大白"]) {
        DabaiViewController *dabaiVC = [[DabaiViewController alloc]init];
        [self.navigationController pushViewController:dabaiVC animated:NO];
    }
    [textField resignFirstResponder];
    return YES;
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
