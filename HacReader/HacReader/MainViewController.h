//
//  MainViewController.h
//  HacReader
//
//  Created by Li Zhang on 4/3/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HacGalleryScrollView.h"
#import "AssetLibraryAccessor.h"

@interface MainViewController : UIViewController
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
