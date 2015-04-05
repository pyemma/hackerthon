//
//  myTabBarController.h
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myTabBar;

@interface myTabBarController : UITabBarController

@property (nonatomic, strong) myTabBar *myTabBar;

- (void)addChildViewController:(UIViewController *)controller withNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;
@end
