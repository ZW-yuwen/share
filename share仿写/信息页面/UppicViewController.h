//
//  UppicViewController.h
//  share仿写
//
//  Created by 仲雯 on 2020/7/27.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ReturnTextBlock)(UIImage *imagee);
typedef void (^ReturnTextBlock2)(NSNumber *num);
@interface UppicViewController : UIViewController

@property(nonatomic, strong) UICollectionView *collectionView;
@property int num;
@property NSNumber *numR;
@property(nonatomic, strong) UIImage *image;
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;
@property (nonatomic, copy) ReturnTextBlock2 returnTextBlock2;
- (void)returnText:(ReturnTextBlock)block;
- (void)returnText2:(ReturnTextBlock2)block2;
@end

NS_ASSUME_NONNULL_END
