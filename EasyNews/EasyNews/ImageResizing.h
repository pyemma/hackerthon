//
//  ImageResizing.h
//  HacReader
//
//  Created by Li Zhang on 4/3/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageResizing : NSObject

- (UIImage*)imageWithImage: (UIImage*) sourceImage
             scaledToWidth: (float) i_width;

- (UIImage*)imageWithImage: (UIImage*) sourceImage
            scaledToHeight: (float) i_height;

- (UIImage*)imageWithImage:(UIImage*)sourceImage
              scaledToSize:(CGSize)newSize;

@end
