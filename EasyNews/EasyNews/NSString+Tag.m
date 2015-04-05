//
//  NSAttributedString+Tag.m
//  HacReader
//
//  Created by Li Zhang on 4/4/15.
//  Copyright (c) 2015 Li Zhang. All rights reserved.
//

#import "NSString+Tag.h"
#import <objc/runtime.h>

static char const * const ObjectTagKey = "ObjectTag";

@implementation NSString (Tag)
-(void)setTag:(int)tag
{
    objc_setAssociatedObject(self, ObjectTagKey, [NSNumber numberWithInt:tag], OBJC_ASSOCIATION_RETAIN);
}

-(int) tag
{
    return (int)[objc_getAssociatedObject(self, ObjectTagKey) integerValue];
}
@end
