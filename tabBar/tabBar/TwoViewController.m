//
//  TwoViewController.m
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "TwoViewController.h"

@implementation TwoViewController
- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    CGRect obj = [UIScreen mainScreen].bounds;
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(obj.origin.x, obj.origin.y + 20, obj.size.width, 32)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(clickLeftButton)];
    
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"tag"] length] != 0)
    {
        [navItem setTitle:[[NSUserDefaults standardUserDefaults] objectForKey:@"tag"]];
    }
    //[navItem setTitle:@"Cloud Tag"];
    
    [navBar pushNavigationItem:navItem animated:NO];
    
    [navItem setLeftBarButtonItem:leftButton];
    
    [self.view addSubview:navBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) clickLeftButton
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
