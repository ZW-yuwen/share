//
//  UppicViewController.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/27.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "UppicViewController.h"
#import "UppicCollectionViewCell.h"

@interface UppicViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *picArr;
    UIImageView *select;
}
@end

@implementation UppicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"上传照片";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _num = 0;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 414, 720) collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    layout.itemSize = CGSizeMake(90, 90);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 3;
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerClass:[UppicCollectionViewCell class] forCellWithReuseIdentifier:@"311"];
    
//    select = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"my_button_pressed.png"]];
//    select.frame = CGRectMake(80, 0, 20, 20);
    
    _collectionView.allowsMultipleSelection = YES;
    
    picArr = [[NSMutableArray alloc]init];
    for (int i = 1; i < 32; i++) {
        [picArr addObject:[NSMutableString stringWithFormat:@"up0%d.JPG", i]];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 31;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UppicCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"311" forIndexPath:indexPath];
    
    [cell.btn setImage:[UIImage imageNamed: picArr[indexPath.item]] forState:UIControlStateNormal];
    [cell.btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
    
}
-(void)pressRight{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"确定上传所选图片" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"" message:@"您已成功上传!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction2 = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
            [self.navigationController popViewControllerAnimated:NO];
        }];
        [alert2 addAction:sureAction2];
        [self presentViewController:alert2 animated:NO completion:nil];
        }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    [self presentViewController:alert animated:NO completion:nil];
}

-(void) press:(UIButton *)btn{
    
    if (!_image) {
        _image = btn.imageView.image;
    }
    
    if (btn.selected == NO) {
        select = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"my_button_pressed.png"]];
        select.frame = CGRectMake(70, 0, 20, 20);
        btn.selected = YES;
        _num++;
        [btn addSubview:select];
    }
    else {
        btn.selected = NO;
        _num--;
        select.alpha = 0;
    }
    NSLog(@"%d", _num);
}

- (void)returnText:(ReturnTextBlock)block{
    self.returnTextBlock = block;
}

- (void)returnText2:(ReturnTextBlock2)block2{
    self.returnTextBlock2 = block2;
}

- (void)viewWillDisappear:(BOOL)animated{
    if(self.returnTextBlock != nil){
        self.returnTextBlock(self.image);
    }
    if(self.returnTextBlock2 != nil){
        _numR = @(_num);
        self.returnTextBlock2(self.numR);
    }
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
