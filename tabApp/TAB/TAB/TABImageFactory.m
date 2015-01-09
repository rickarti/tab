//
//  TABImageFactory.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABImageFactory.h"

@implementation TABImageFactory

+(UIImage *) createCancelImage {

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 30, 30));
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillPath(context);
    // TODO: Draw X in white
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    CGContextMoveToPoint(context, 18, 18);
    CGContextAddLineToPoint(context, 32, 32);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 18, 32);
    CGContextAddLineToPoint(context, 32, 18);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
