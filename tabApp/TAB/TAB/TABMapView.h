//
//  TABMapView.h
//  TAB
//
//  Created by Rick Johnson on 1/17/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TABMapView : UIView

@property MKMapView *mapView;

- (void)configureView;

@end
