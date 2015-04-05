//
//  myTabBar.h
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myTabBar;

@protocol myTabBarDelegate <NSObject>

- (void)myTabBar:(myTabBar *)myTabBar didSelectedAtIndex:(NSInteger)index;

@end

@interface myTabBar : UIImageView


@property (nonatomic, weak) id<myTabBarDelegate> delegate;

- (void)addItemWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;


@end
