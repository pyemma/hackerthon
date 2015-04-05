//
//  HacGalleryScrollView.h
//  HacReader
//
//  Created by Li Zhang on 4/4/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageResizing.h"
#import "NetworkRequestHandler.h"
#import "NSURL+Tag.h"
#import "UIImage+Tag.h"

@interface HacGalleryScrollView : UIView

@property (strong, nonatomic)   UIScrollView    *imageScrollView;
@property (strong, nonatomic)   NSMutableDictionary  *imagesDictionary;
@property (strong, nonatomic)   NSMutableDictionary  *imageViewsDictionary;
@property (strong, nonatomic)   NSMutableDictionary  *textsDictionary;
@property (strong, nonatomic)   NSMutableDictionary  *textViewsDictionary;

//-----------------------------------------------------------------
//  Following property must be set by the user before method call
//-----------------------------------------------------------------
@property ( nonatomic) float widthOfGapBtnColumnsInScrollView;
@property ( nonatomic) float widthOfGapBtnViewColumnsInScrollView ;
@property ( nonatomic) float heightOfGapBtnImageOfSameColumn;
@property ( nonatomic) float widthOfColumnInScrollView ;

//-----------------------------------------------------------------
//  Following property need to be set as requirement
//-----------------------------------------------------------------
@property ( nonatomic) NSInteger widthOfBorderSurroundedImage;
@property ( nonatomic) UIColor  *colorOfBorderSurroundedImage;
@property ( nonatomic) NSInteger cornerRadiusOfImage;
@property ( nonatomic) BOOL      isMaskedTheCornerOfImage;

//-----------------------------------------------------------------
//  Following property need to be set as requirement
//-----------------------------------------------------------------
@property ( nonatomic) UIImage  *backgroundImage;



//-----------------------------------------------------------------
//  If you display images from iphone "photoes" then call the below
//  method to show them in a waterfall view
//-----------------------------------------------------------------
- (void) addSubviewToScrollViewFromUIImageArray:(NSArray *)arrayOfUIImageSource
                                     noOfColumn:(int)noOfColumn;

//-----------------------------------------------------------------
//  If you have several image URL and need show them in waterfall
//  view then use the below method
//-----------------------------------------------------------------

- (void) addSubviewToScrollViewFromImageUrlStringArray:(NSArray *)arrayOfImageUrlStringSource
                                    textUrlStringArray:(NSArray *) arrayOfTextUrlStringSource
                                            OfColumnNo:(int)noOfColumn;

- (void) addSubviewToScrollViewFromImageUrlStringArray:(NSArray *)arrayOfImageUrlStringSource
                                    textStringArray:(NSArray *) arrayOfTextStringSource
                                            OfColumnNo:(int)noOfColumn;

//-----------------------------------------------------------------
//  If you have several image URL, image-size known. then use it.
//-----------------------------------------------------------------
/*
- (void) addSubviewToScrollViewFromPhotoArray:(NSArray *)arrayOfPhoto
                                   OfColumnNo:(int)noOfColumn
                           withKnownImageSize:(BOOL)isImageSizeKnown;
 */

@end
