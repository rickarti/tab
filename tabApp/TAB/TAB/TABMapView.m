//
//  TABMapView.m
//  TAB
//
//  Created by Rick Johnson on 1/17/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMapView.h"

@implementation TABMapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configureView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.mapView = [[MKMapView alloc] init];
    self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_mapView];
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_mapView);
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|[_mapView]|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[_mapView]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    
    CLLocationCoordinate2D track;
    track.latitude = 32.90;
    track.longitude = -117.22;
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.5;
    span.longitudeDelta = 0.5;
    region.span = span;
    region.center = track;
    
//    MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:@"Title of Place Here" andCoordinate:track];
    
//    [self.mapView addAnnotation:newAnnotation];
    [self.mapView setRegion:region animated:TRUE];
    [self.mapView regionThatFits:region];
}

@end
