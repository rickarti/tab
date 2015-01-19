//
//  TABMapView.m
//  TAB
//
//  Created by Rick Johnson on 1/17/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMapView.h"
#import "TABMapViewController.h"
#import "TABImageFactory.h"

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
    
    UIView *navBar = [UIView new];
    navBar.translatesAutoresizingMaskIntoConstraints = NO;
    navBar.backgroundColor = [UIColor whiteColor];
    navBar.layer.borderWidth = 1.0f;
    navBar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    navBar.alpha = 0.7;
    [self addSubview:navBar];
    
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setImage:[TABImageFactory createCancelImage] forState:UIControlStateNormal];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [cancelButton addTarget:[self viewController] action:@selector(doCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    
    UITextField *addressTextField = [UITextField new];
    addressTextField.translatesAutoresizingMaskIntoConstraints = NO;
    addressTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [addressTextField setReturnKeyType: UIReturnKeyDone];
    [addressTextField setDelegate:[self viewController]];
    addressTextField.backgroundColor = [UIColor whiteColor];
    addressTextField.layer.borderWidth = 1.0f;
    addressTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    addressTextField.alpha = 0.9;
    addressTextField.textAlignment = NSTextAlignmentCenter;
    addressTextField.placeholder = @"DELIVERY ADDRESS";
    [self addSubview:addressTextField];
    
    UIButton *setLocationButton = [[UIButton alloc] init];
    setLocationButton.translatesAutoresizingMaskIntoConstraints = NO;
    [setLocationButton addTarget:[self viewController] action:@selector(doSetLocation) forControlEvents:UIControlEventTouchUpInside];
    [setLocationButton setTitle:@"SET LOCATION" forState:UIControlStateNormal];
    [setLocationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    setLocationButton.backgroundColor = [UIColor blackColor];
    setLocationButton.alpha = 0.7;

    [self addSubview:setLocationButton];
    
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_mapView, navBar, cancelButton, addressTextField, setLocationButton);
    
    // Layout Map View
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

    [self.mapView setRegion:region animated:TRUE];
    [self.mapView regionThatFits:region];

    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|[navBar(60)]-10-[addressTextField(30)]"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[navBar]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|-15-[cancelButton]"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:[cancelButton]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[addressTextField]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    // Layout Set Location Button
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:[setLocationButton]|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[setLocationButton]|"
                          options:0 metrics:nil views:viewsDictionary]];
}

- (TABMapViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[TABMapViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (TABMapViewController *)responder;
}

@end
