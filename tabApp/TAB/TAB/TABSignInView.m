//
//  TABSignInView.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABSignInView.h"
#import "TABImageFactory.h"
#import "TABUIUtil.h"
#import "TABSignInViewController.h"

@implementation TABSignInView

- (void)configureView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboardEditing)];
    // prevents the scroll view from swallowing up the touch event of child buttons
    tapGesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tapGesture];
    
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setImage:[TABImageFactory createCancelImage] forState:UIControlStateNormal];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [cancelButton addTarget:[self viewController] action:@selector(doCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    
    UILabel *signInLabel = [UILabel new];
    signInLabel.text = @"SIGN IN";
    signInLabel.translatesAutoresizingMaskIntoConstraints = NO;
    signInLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:signInLabel];
    
    self.emailTextField = [self createTextViewWithPlaceholder:@"EMAIL"];
    self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self addSubview:_emailTextField];
    
    self.passwordTextField = [self createTextViewWithPlaceholder:@"PASSWORD"];
    self.passwordTextField.secureTextEntry = YES;
    [self addSubview:_passwordTextField];
    
    UIButton *signInButton = [[UIButton alloc] init];
    signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    [signInButton addTarget:[self viewController] action:@selector(doSignIn) forControlEvents:UIControlEventTouchUpInside];
    [signInButton setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    signInButton.backgroundColor = [TABUIUtil colorWithHex:0x0FAAD2];
    signInButton.layer.borderWidth = 1.0f;
    signInButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    signInButton.layer.cornerRadius = 4.0f;
    [self addSubview:signInButton];
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(cancelButton, signInLabel,
                                                                   _emailTextField,
                                                                   _passwordTextField,
                                                                   signInButton);
  
    // Layout Cancel Button
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-10-[cancelButton]"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:signInLabel attribute:NSLayoutAttributeCenterY
                                                    multiplier:1 constant:0.0]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[signInLabel(30)]-30-[_emailTextField(30)]-20-[_passwordTextField(30)]" options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-60-[signInLabel]-60-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[_emailTextField]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[_passwordTextField]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[signInButton]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:[signInButton]-40-|"
                          options:0 metrics:nil views:viewsDictionary]];
}

- (TABSignInViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[TABSignInViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (TABSignInViewController *)responder;
}

// TOOD: Putting this here for now, but consider adding a UIView Category or UIView subclass
// or a pure ComponentFactory class
- (UITextField *) createTextViewWithPlaceholder: (NSString *) placeholder {
    UITextField *textField = [UITextField new];
    // Set the Title of the [Return] button to [Done]
    [textField setReturnKeyType: UIReturnKeyDone];
    [textField setDelegate:[self viewController]];
    
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = placeholder;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.cornerRadius = 6.0f;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    return textField;
}

-(void) dismissKeyboardEditing {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self endEditing:TRUE];
}

@end
