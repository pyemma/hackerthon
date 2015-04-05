//
//  MainViewController.m
//  EasyNews
//
//  Created by Li Zhang on 4/5/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import "MainViewController.h"
#import "myTabBar.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "myTabBarController.h"
#import "UIImageView+Taglabel.h"

@interface MainViewController ()<UIGestureRecognizerDelegate>

@end
@implementation MainViewController

- (void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender
{
    NSDictionary *myClassDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Transportation", @"1",
                                 @"Entertainment", @"2",
                                 @"Sport", @"3",
                                 @"Technology", @"4",
                                 @"Economy", @"5",
                                 @"General News", @"6", nil];
    
    CGPoint tapLocation = [sender locationInView:self.view];
    
    for (UIImageView *view in self.view.subviews) {
        
        if (CGRectContainsPoint(view.frame, tapLocation)) {
            //NSLog(@"View tapped at %@",[myClassDict objectForKey: [NSString stringWithFormat:@"%d", view.tag]]);
            [[NSUserDefaults standardUserDefaults] setObject:[myClassDict objectForKey: [NSString stringWithFormat:@"%ld", (long)view.tag]] forKey:@"tag"];
        }
    }
    //
    
    //tabBar
    myTabBarController *tabBarC = [[myTabBarController alloc] init];
    tabBarC.myTabBar.image = [UIImage imageNamed:@"tabBar_back"];
    
    //1
    OneViewController *oneVc = [[TwoViewController alloc] init];
    oneVc.view.backgroundColor = [UIColor whiteColor];
    oneVc.title = @"1";
    [tabBarC addChildViewController:oneVc withNormalImageName:@"news" selectedImageName:@"news"];
    
    //1
    TwoViewController *twoVc = [[OneViewController alloc] init];
    twoVc.view.backgroundColor = [UIColor whiteColor];
    twoVc.title = @"2";
    [tabBarC addChildViewController:twoVc withNormalImageName:@"keyword" selectedImageName:@"keyword"];
    
    [self presentViewController:tabBarC animated:YES completion:^{}];
    
    //[self.navigationController pushViewController:tabBarC animated:YES];
}

-(void)addImageView:(NSString *)path
                  x:(NSInteger)x
                  y:(NSInteger)y
              width:(NSInteger)width
             height:(NSInteger)height
                tag:(NSInteger)tag{
    //-(void)addImageView{
    UIImageView *imgview = [[UIImageView alloc]
                            initWithFrame:CGRectMake(x, y, width, height)];
    imgview.image = [UIImage imageNamed:path];
    imgview.tag = tag;
    //[imgview setLabel:tag];
    [imgview setContentMode:UIViewContentModeScaleAspectFit];
    
    imgview.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleSingleFingerEvent:)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate= self;
    [imgview addGestureRecognizer:singleFingerOne];
    //    [singleFingerOne release];
    
    [self.view addSubview:imgview];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addImageView:@"1" x:35 y:200 width:100 height:150 tag:1];
    [self addImageView:@"2" x:85 y:115 width:100 height:150 tag:2];
    [self addImageView:@"3" x:184 y:115 width:100 height:150 tag:3];
    [self addImageView:@"4" x:184 y:289 width:100 height:150 tag:4];
    [self addImageView:@"5" x:135 y:376 width:100 height:150 tag:5];
    [self addImageView:@"6" x:234 y:201 width:100 height:150 tag:6];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
