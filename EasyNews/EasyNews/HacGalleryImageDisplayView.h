//
//  HacGalleryImageDisplayView.h
//  HacReader
//
//  Created by Li Zhang on 4/4/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HacGalleryScrollView.h"
#import "RMGalleryView.h"

@protocol HacGalleryImageDisplayViewDelegate <NSObject>

-(void)closeButtonClicked:(UIButton *)sender;

@end

@interface HacGalleryImageDisplayView : UIView
@property (nonatomic) int countOfImages;
@property (nonatomic,weak) HacGalleryScrollView *imageGalleryScrollView;

@property (nonatomic,strong) RMGalleryView *galleryView;
/**
 The gallery index.
 @discussion Typically, this will be used to set the initial gallery index and then to query the current index when needed.
 @discussion The gallery view delegate notifies index changes.
 */
@property (nonatomic, assign) NSUInteger galleryIndex;

@property (nonatomic, weak) id<HacGalleryImageDisplayViewDelegate> delegate;

/**
 The tap gesture recognizer. Toggles bars when the gallery view controller is inside a navigation view controller or dismisses the view controller when presented modally (without a navigation bar).
 @discussion Disable this gesture recognizer to disable the default tap behavior.
 */
@property (nonatomic, readonly) UITapGestureRecognizer *tapGestureRecognizer;
@end
