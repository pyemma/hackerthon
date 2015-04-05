//
//  OneViewController.m
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "OneViewController.h"
#import "myTabBar.h"
#import "DBSphereView.h"
#import "MainViewController.h"
@interface OneViewController ()

@property (nonatomic, retain) DBSphereView *sphereView;

@end

@implementation OneViewController

@synthesize sphereView;


-(id) initController:(NSString *)str
{
    
    self = [super init];
    if(self)
    {
        showString = str;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect obj = [UIScreen mainScreen].bounds;
    sphereView = [[DBSphereView alloc] initWithFrame:CGRectMake(obj.origin.x, obj.origin.y + 130, obj.size.width, obj.size.height)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray *tagArray = [[NSMutableArray alloc] init];
    tagArray[0] = @"Amazon";
    tagArray[1] = @"Google";
    tagArray[2] = @"Facebook";
    tagArray[3] = @"MIT";
    tagArray[4] = @"Health";
    tagArray[5] = @"Computer";
    tagArray[6] = @"Interacrion";
    tagArray[7] = @"BCI";
    tagArray[8] = @"Driverless Car";
    tagArray[9] = @"Autopilot";
    tagArray[10] = @"Startup";
    tagArray[11] = @"Microsoft";
    tagArray[12] = @"Girls Code";
    tagArray[13] = @"Instagram";
    tagArray[14] = @"Innovation";
    tagArray[15] = @"Robots";
    tagArray[16] = @"NASA";
    tagArray[17] = @"The Future";
    tagArray[18] = @"Quantum";
    tagArray[19] = @"Apple";
    tagArray[20] = @"Space";
    for (NSInteger i = 0; i < 20; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:tagArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:30.];
        btn.frame = CGRectMake(0, 0, 200, 80);
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [sphereView addSubview:btn];
    }
    [sphereView setCloudTags:array];
    sphereView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sphereView];
    
    // Do any additional setup after loading the view, typically from a nib.
    
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

- (void)buttonPressed:(UIButton *)btn
{
    [sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [sphereView timerStart];
        }];
    }];
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