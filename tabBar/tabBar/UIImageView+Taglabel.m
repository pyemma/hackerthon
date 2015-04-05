//
//  UIImage+Tag.m
//  ImageGallery
//
//  Created by Sandip Saha on 05/11/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "UIImageView+Taglabel.h"
#import <objc/runtime.h>

static char const * const ObjectTagKey = "ObjectTag";
@implementation UIImageView (Label)

-(void)setLabel:(NSString *)label
{
    objc_setAssociatedObject(self, ObjectTagKey, label, OBJC_ASSOCIATION_RETAIN);
}

-(NSString *) label
{
    return (NSString *)[objc_getAssociatedObject(self, ObjectTagKey) stringValue];
}
@end
