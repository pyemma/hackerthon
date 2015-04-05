//
//  MainViewController.m
//  HacReader
//
//  Created by Li Zhang on 4/3/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()<HacGalleryScrollViewDelegate>

@end

@implementation TwoViewController
{
    CGFloat widthOfScreen ;
    CGFloat heightOfScreen ;
    NSArray *feedsArray;
    //UITapGestureRecognizer *recognizer;
}
@synthesize assetLibraryAccessor;
@synthesize scrollView;
@synthesize imageUrlArray;
@synthesize textUrlArray;
@synthesize textsArray;

@synthesize widthOfColumnInScrollView;
@synthesize widthOfGapBtnColumnsInScrollView;
@synthesize widthOfGapBtnViewColumnsInScrollView;
@synthesize heightOfGapBtnImageOfSameColumn;

- (instancetype)init {
    self = [super init];
    
    if (self) {
        imageUrlArray = [[NSMutableArray alloc] initWithCapacity:1];
        textUrlArray = [[NSMutableArray alloc] initWithCapacity:1];
        textsArray = [[NSMutableArray alloc] initWithCapacity:1];
        feedsArray = [[NSArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
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
     */

    //  Other set up
    CGRect frameOfScreen = [[UIScreen mainScreen] bounds];
    widthOfScreen = frameOfScreen.size.width;
    heightOfScreen = frameOfScreen.size.height;
    NSLog(@"widthOfScreen : %f heightOfscren %f",widthOfScreen,heightOfScreen);
    scrollView = [[HacGalleryScrollView alloc] initWithFrame:CGRectMake(0, 0, widthOfScreen, heightOfScreen)];
    //scrollView = [[HacGalleryScrollView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    scrollView.delegate = self;
    scrollView.widthOfColumnInScrollView           =180;
    scrollView.widthOfGapBtnColumnsInScrollView    =5;
    scrollView.widthOfGapBtnViewColumnsInScrollView=5;
    scrollView.heightOfGapBtnImageOfSameColumn     =5;
    
    scrollView.widthOfBorderSurroundedImage        =2;
    scrollView.colorOfBorderSurroundedImage        =[UIColor whiteColor];
    scrollView.cornerRadiusOfImage                 =5;
    scrollView.isMaskedTheCornerOfImage            =YES;
    
    scrollView.backgroundImage                     = [UIImage imageNamed:@"backGround.png"];
    [self.view addSubview:scrollView];
    
    
    //----------------
    // using image url
    //----------------
    /*
     [self addUrlToTextUrlArray];
     
     [self addUrlToImageUrlArray];
     
     [self.scrollView addSubviewToScrollViewFromImageUrlStringArray:imageUrlArray textUrlStringArray:textUrlArray OfColumnNo:2];
     */
    
    [self dataDownloadsRequriedWithImageArray:imageUrlArray textArray:textsArray];
    
    //recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    //[self.scrollView.scrollViewOfImages addGestureRecognizer:recognizer];
    
    // get picture from asset library
    /*
     assetLibraryAccessor = [[AssetLibraryAccessor alloc] init];
     [assetLibraryAccessor getAllPictures];
     
     __unsafe_unretained typeof(self) weakSelf = self;
     [assetLibraryAccessor setCompletionHandler:^{
     
     NSArray *arrayOfImages = weakSelf.assetLibraryAccessor.imageArrayOfAssetLibraryAccessor;
     //[weakSelf.scrollView addSubviewToScrollViewFromUIImageOfColumnNo:3];
     
     
     weakSelf.widthOfColumnInScrollView           =100;
     weakSelf.widthOfGapBtnColumnsInScrollView    =5;
     weakSelf.widthOfGapBtnViewColumnsInScrollView=5;
     weakSelf.heightOfGapBtnImageOfSameColumn     =5;
     [weakSelf.scrollView addSubviewToScrollViewFromUIImageArray:arrayOfImages noOfColumn:3];
     }];
     */
}

-(void) shouldReturn
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)jsonSerialized {
    for (NSDictionary *feed in feedsArray) {
        if ([feed objectForKey:@"Image"] && [feed objectForKey:@"Summary"]) {
            [imageUrlArray addObject:[feed objectForKey:@"Image"]];
            NSLog(@"Image is %@\n", [feed objectForKey:@"Image"]);
            [textsArray addObject:[feed objectForKey:@"Summary"]];
            NSLog(@"Text is %@\n", [feed objectForKey:@"Summary"]);
        }
    }
}

- (void) addUrlToImageUrlArray
{
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://i2.cdn.turner.com/cnn/dam/assets/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg"];
    [imageUrlArray addObject:@"http://www.wallsave.com/wallpapers/2560x1920/beauty-of-nature/545885/beauty-of-nature-field-sunflowers-beautiful-clouds-hi-545885.jpg"];
    [imageUrlArray addObject:@"http://datastore04.rediff.com/h1500-w1500/thumb/5A5A5B5B4F5C1E5255605568365E655A63672A606D6C/0upnd2vwarhp3y9i.D.0.Copy-of-Nature-Wallpapers-9.jpg"];
    [imageUrlArray addObject:@"http://wp.1920x1080.org/wp-content/uploads/2011/11/wallpapers-of-nature-546319448.jpg"];
    [imageUrlArray addObject:@"http://www.wallcoo.net/nature/amazing%20hd%20landscapes%20wallpapers/wallpapers/1600x1200/%5Bwallcoo_com%5D_Beautiful%20Nature%20%20HD%20Landscape%2020.jpg"];
    [imageUrlArray addObject:@"http://wp.1920x1080.org/wp-content/uploads/2011/11/wallpapers-of-nature-575376234.jpg"];
    [imageUrlArray addObject:@"http://www.bigpicture.in/wp-content/uploads/2010/07/LatestCollectionOfNaturePhotosByIustyn11.jpg"];
    /*
     [imageUrlArray addObject:@"http://img.tradeindia.com/fp/1/377/778.jpg"];
     [imageUrlArray addObject:@"http://behance.vo.llnwd.net/profiles17/1327451/projects/4862239/b3d14c57055cd37557105b6d0baebcfc.jpg"];
     [imageUrlArray addObject:@"http://3.bp.blogspot.com/-ls3LcSetQdw/TmUwikE1ljI/AAAAAAAAFtM/MU87FnNvXT4/s1600/mobile_wallpaper_nature%2B%25281%2529.jpg"];
     [imageUrlArray addObject:@"http://cache4.indulgy.net/j3/z4/b/0203a4b04dd7c1XL.jpg"];
     [imageUrlArray addObject:@"http://carlylove.files.wordpress.com/2011/07/016.jpg"];
     [imageUrlArray addObject:@"http://4.bp.blogspot.com/-uc1hO9wWYnY/T-3ir12mTVI/AAAAAAAAOy4/9mx0UP3Hq6A/s1600/Leonid+Andreyev++Vammasluu+At+Sunset.jpg"];
     [imageUrlArray addObject:@"http://lijiun.files.wordpress.com/2013/05/p1010003.jpg"];
     [imageUrlArray addObject:@"http://thefabweb.com/wp-content/uploads/2012/03/Sunny-Side-Up.jpg"];
     [imageUrlArray addObject:@"http://thefabweb.com/wp-content/uploads/2012/03/Cherry-Trees1.jpg"];
     [imageUrlArray addObject:@"http://browseideas.com/wp-content/uploads/2011/11/Inspiring-Examples-of-Nature-Photography-06.jpg"];
     [imageUrlArray addObject:@"http://viewfromnaturalflorida.files.wordpress.com/2013/03/saucer-magnolia-under-blue-sky-web.jpg"];
     [imageUrlArray addObject:@"http://www.wallsave.com/wallpapers/1280x800/new-love-nature/517518/new-love-nature-hd-staircase-stairs-of-related-517518.jpg"];
     [imageUrlArray addObject:@"http://thefabweb.com/wp-content/uploads/2012/06/1210.jpg"];
     [imageUrlArray addObject:@"http://thefabweb.com/wp-content/uploads/2012/06/88.jpg"];
     [imageUrlArray addObject:@"http://bookurgift.com/images/111.jpg"];
     [imageUrlArray addObject:@"http://images4.fanpop.com/image/photos/23800000/Pink-flowers-pink-color-23830799-1920-1233.jpg"];
     
     [imageUrlArray addObject:@"http://4.bp.blogspot.com/-ik3E8PBBf70/TwaZ9PMNbrI/AAAAAAAAAG0/kNrGnEbZ-WY/s640/flowers2.jpg"];
     
     */
}

- (void) addUrlToTextUrlArray {
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://www.cnn.com/2015/04/03/entertainment/furious-7-box-office/index.html"];
    [textUrlArray addObject:@"http://wp.1920x1080.org/wp-content/uploads/2011/11/wallpapers-of-nature-546319448.jpg"];
    [textUrlArray addObject:@"http://www.wallcoo.net/nature/amazing%20hd%20landscapes%20wallpapers/wallpapers/1600x1200/%5Bwallcoo_com%5D_Beautiful%20Nature%20%20HD%20Landscape%2020.jpg"];
    [textUrlArray addObject:@"http://wp.1920x1080.org/wp-content/uploads/2011/11/wallpapers-of-nature-575376234.jpg"];
    [textUrlArray addObject:@"http://www.bigpicture.in/wp-content/uploads/2010/07/LatestCollectionOfNaturePhotosByIustyn11.jpg"];
    [textUrlArray addObject:@"http://wp.1920x1080.org/wp-content/uploads/2011/11/wallpapers-of-nature-575376234.jpg"];
    [textUrlArray addObject:@"http://www.bigpicture.in/wp-content/uploads/2010/07/LatestCollectionOfNaturePhotosByIustyn11.jpg"];
}


/*********************************************************************************
 Animate Rotation
 *********************************************************************************/

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        [self.scrollView removeFromSuperview];
        scrollView = [[HacGalleryScrollView alloc] initWithFrame:CGRectMake(0, 0, heightOfScreen   , widthOfScreen)];
        
        scrollView.widthOfColumnInScrollView           =([UIScreen mainScreen].bounds.size.width - 30)/5;
        scrollView.widthOfGapBtnColumnsInScrollView    =5;
        scrollView.widthOfGapBtnViewColumnsInScrollView=5;
        scrollView.heightOfGapBtnImageOfSameColumn     =5;
        
        scrollView.widthOfBorderSurroundedImage        =5;
        scrollView.colorOfBorderSurroundedImage        =[UIColor whiteColor];
        scrollView.cornerRadiusOfImage                 =5;
        scrollView.isMaskedTheCornerOfImage            =YES;
        
        scrollView.backgroundImage                     = [UIImage imageNamed:@"backGround.png"];
        [self.view addSubview:scrollView];
        [self.scrollView addSubviewToScrollViewFromImageUrlStringArray:imageUrlArray textUrlStringArray:textUrlArray OfColumnNo:5];
        //[self.scrollView addGestureRecognizer:recognizer];
        NSLog(@"Change to custom UI for landscape");
        
        //scrollView.arrayOfUIImage = assetLibraryAccessor.imageArrayOfAssetLibraryAccessor;
        //[scrollView addSubviewToScrollViewFromUIImageOfColumnNo:5];
        
        
    }
    else if (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
             toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        [self.scrollView removeFromSuperview];
        scrollView = [[HacGalleryScrollView alloc] initWithFrame:CGRectMake(0, 0, widthOfScreen   , heightOfScreen)];
        
        scrollView.widthOfColumnInScrollView           =([UIScreen mainScreen].bounds.size.width - 20)/5;
        scrollView.widthOfGapBtnColumnsInScrollView    =5;
        scrollView.widthOfGapBtnViewColumnsInScrollView=5;
        scrollView.heightOfGapBtnImageOfSameColumn     =5;
        
        scrollView.widthOfBorderSurroundedImage        =5;
        scrollView.colorOfBorderSurroundedImage        =[UIColor whiteColor];
        scrollView.cornerRadiusOfImage                 =5;
        scrollView.isMaskedTheCornerOfImage            =YES;
        
        scrollView.backgroundImage                     = [UIImage imageNamed:@"backGround.png"];
        [self.view addSubview:scrollView];
        [self.scrollView addSubviewToScrollViewFromImageUrlStringArray:imageUrlArray textUrlStringArray:textUrlArray OfColumnNo:3];
        //[self.scrollView addGestureRecognizer:recognizer];
        NSLog(@"Change to custom UI for portrait");
        
    }
}

#pragma mark - Networking

- (void) dataDownloadsRequriedWithImageArray:(NSMutableArray *) imageArray
                                   textArray:(NSMutableArray *) textArray
{
    NSString *urlStr = [NSString stringWithFormat:@"10.116.3.119:3000/categories/%@.json", [[NSUserDefaults standardUserDefaults] objectForKey:@"tag"]];
    NSLog(@"String is %@\n", urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request
                                                    completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error){
                                                        //NSLog(@"The error is %@\n", error);
                                                        if (!error) {
                                                            if ([request.URL isEqual:url]) {
                                                                feedsArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:localfile] options:1 error:nil];
                                                                
                                                                [self jsonSerialized];
                                                                
                                                                [self.scrollView addSubviewToScrollViewFromImageUrlStringArray:imageUrlArray
                                                                                                               textStringArray:textsArray OfColumnNo:2];
                                                            }
                                                        }
                                                    }];
    [task resume];
    
}

@end
