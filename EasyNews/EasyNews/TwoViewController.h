//
//  TwoViewController.h
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HacGalleryScrollView.h"
#import "AssetLibraryAccessor.h"

@interface TwoViewController : UIViewController
@property (nonatomic, strong) AssetLibraryAccessor *assetLibraryAccessor;
@property (strong, nonatomic) HacGalleryScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *imageUrlArray;
@property (strong, nonatomic) NSMutableArray *textUrlArray;
@property (strong, nonatomic) NSMutableArray *textsArray;

@property ( nonatomic) NSInteger widthOfGapBtnColumnsInScrollView;
@property ( nonatomic) NSInteger widthOfGapBtnViewColumnsInScrollView ;
@property ( nonatomic) NSInteger heightOfGapBtnImageOfSameColumn;
@property ( nonatomic) NSInteger widthOfColumnInScrollView ;
@end
