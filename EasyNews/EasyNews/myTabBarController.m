//
//  myTabBarController.m
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "myTabBarController.h"
#import "myTabBar.h"


@interface myTabBarController()<myTabBarDelegate>



@end

@implementation myTabBarController

- (myTabBar *)myTabBar
{
    if (!_myTabBar) {
        _myTabBar = [[myTabBar alloc] init];
        _myTabBar.delegate = self;
        
    }
    return _myTabBar;
}

- (void)addChildViewController:(UIViewController *)controller withNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName
{
    [self addChildViewController:controller];
    
    [self.myTabBar addItemWithNormalImageName:normalImageName selectedImageName:selectedImageName];
}

- (void)myTabBar:(myTabBar *)myTabBar didSelectedAtIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.myTabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:self.myTabBar];
    
}

- (void)viewDidLoad {

}

@end
