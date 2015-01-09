//
//  TABInitialView.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABInitialView.h"
#import "TABInitialViewController.h"
#import "TABUIUtil.h"

@implementation TABInitialView

- (void)configureView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.backgroundColor = [UIColor blackColor];
    
    UIView *imageContainer = [UIView new];
    imageContainer.backgroundColor = [UIColor lightGrayColor];
    imageContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imageContainer];
    
    UIButton *createAccountButton = [[UIButton alloc] init];
    createAccountButton.translatesAutoresizingMaskIntoConstraints = NO;
    [createAccountButton addTarget:[self viewController] action:@selector(doCreateAccount) forControlEvents:UIControlEventTouchUpInside];
    [createAccountButton setTitle:@"CREATE ACCOUNT" forState:UIControlStateNormal];
    [createAccountButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    createAccountButton.backgroundColor = [TABUIUtil colorWithHex:0x0FAAD2];
    createAccountButton.layer.borderWidth = 1.0f;
    createAccountButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    createAccountButton.layer.cornerRadius = 4.0f;
    [self addSubview:createAccountButton];
    
    UIButton *signInButton = [[UIButton alloc] init];
    signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    [signInButton addTarget:[self viewController] action:@selector(doSignIn) forControlEvents:UIControlEventTouchUpInside];
    [signInButton setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    // signInButton.backgroundColor = [TABUIUtil colorWithHex:0x0FAAD2];
    signInButton.layer.borderWidth = 1.0f;
    signInButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    signInButton.layer.cornerRadius = 4.0f;
    [self addSubview:signInButton];
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(imageContainer,
                                                                   signInButton,
                                                                   createAccountButton);
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|-[imageContainer]-[createAccountButton]-20-[signInButton]-40-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[signInButton]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[createAccountButton]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
}

- (TABInitialViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[TABInitialViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (TABInitialViewController *)responder;
}

@end
