//
//  ScrollerTableViewCell.m
//  share仿写
//
//  Created by 仲雯 on 2020/7/22.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ScrollerTableViewCell.h"

@implementation ScrollerTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 414, 200)];
    [self.contentView addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(150, 180, 40, 10)];
    [self.contentView addSubview:_pageControl];
    
    _time = [[NSTimer alloc]init];
    
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(414 * i, 0, 414, 200);
        
        NSString *image = [NSString stringWithFormat:@"main_img%d.png", i+1];
        imageView.image = [UIImage imageNamed:image];
        [_scrollView addSubview:imageView];
     }
    
    _time = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(repeat) userInfo:nil repeats:YES];
    //消息循环
    [[NSRunLoop currentRunLoop] addTimer:_time forMode:NSDefaultRunLoopMode];
    return self;
    
}

-(void)layoutSubviews {
    
    _scrollView.bounces = NO;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.contentSize = CGSizeMake(414 * 4, 200);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    //取消滚动时的横条
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _pageControl.numberOfPages = 4;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.currentPage = 0;
}

-(void) repeat{
    NSInteger num = self.pageControl.currentPage;
    if (num == 3){
        num = 0;
        _scrollView.contentOffset = CGPointMake(0, 0);
        [_scrollView setContentOffset:_scrollView.contentOffset animated:YES];
    }else{
        num++;
    }
    //设置偏移量
    CGFloat offset = num * [UIScreen mainScreen].bounds.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(offset, 0);
    }];
    
}
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.time invalidate];
}
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    _time = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(repeat) userInfo:nil repeats:YES];
    //消息循环
    [[NSRunLoop currentRunLoop] addTimer:_time forMode:NSDefaultRunLoopMode];
}

//设置小圆点与图片同步
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_scrollView.contentOffset.x == 0) {
        _pageControl.currentPage = 0;
    }
    if (_scrollView.contentOffset.x == 414) {
        _pageControl.currentPage = 1;
    }
    if (_scrollView.contentOffset.x == 414 * 2)  {
        _pageControl.currentPage = 2;
    }
    if (_scrollView.contentOffset.x == 414 * 3)  {
        _pageControl.currentPage = 3;
    }
}

@end
