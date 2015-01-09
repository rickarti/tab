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

    // Setup the Graphics Context and Ref
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw and Fill a gray circle
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 30, 30));
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillPath(context);
    
    // Draw a white X centered in the circle
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    CGContextMoveToPoint(context, 18, 18);
    CGContextAddLineToPoint(context, 32, 32);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 18, 32);
    CGContextAddLineToPoint(context, 32, 18);
    CGContextStrokePath(context);
    
    // Collect the reference to return the UIImage and end the Context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
