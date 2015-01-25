//
//  TABLogoContainerView.m
//  TAB
//
//  Created by Rick Johnson on 1/24/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABLogoContainerView.h"

@implementation TABLogoContainerView


- (void)drawRect:(CGRect)rect {
    
    //self.center.x
    CGPoint centerPoint = self.center;
    CGFloat endradius = self.bounds.size.width/2;
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat colorComponents[8] = { 0.4, 0.4, 0.4, 1.0,  // Start color
        0.0, 0.0, 0.0, 1.0 }; // End color
    
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorspace, colorComponents,
                                                                  locations, num_locations);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // CGContextDrawLinearGradient(context, gradient, centerPoint, centerPoint, kCGGradientDrawsAfterEndLocation);
    //CGContextDrawRadialGradient(<#CGContextRef context#>, <#CGGradientRef gradient#>, <#CGPoint startCenter#>, <#CGFloat startRadius#>, <#CGPoint endCenter#>, <#CGFloat endRadius#>, <#CGGradientDrawingOptions options#>)
    CGContextDrawRadialGradient(context, gradient, centerPoint, 0.0, centerPoint, endradius, kCGGradientDrawsAfterEndLocation);
}

@end
