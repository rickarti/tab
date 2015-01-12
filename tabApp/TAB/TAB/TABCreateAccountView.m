//
//  TABCreateAccountView.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABCreateAccountViewController.h"
#import "TABCreateAccountView.h"
#import "TABImageFactory.h"
#import "TABUIUtil.h"

@implementation TABCreateAccountView

- (void)configureView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.dateFormat = [[NSDateFormatter alloc] init];
    [self.dateFormat setDateFormat:@"MM-dd-yyyy"];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.firstNameTextField = [self createTextViewWithPlaceholder:@"FIRST"];
    self.lastNameTextField = [self createTextViewWithPlaceholder:@"LAST"];
    
    self.emailTextField = [self createTextViewWithPlaceholder:@"EMAIL"];
    self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    self.phoneNumberTextField = [self createTextViewWithPlaceholder:@"PHONE NUMBER"];
    self.phoneNumberTextField.keyboardType = UIKeyboardTypePhonePad;
    
    self.zipCodeTextField = [self createTextViewWithPlaceholder:@"ZIP CODE"];
    self.zipCodeTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
    self.birthDateTextField = [self createTextViewWithPlaceholder:@"DATE OF BIRTH"];
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateBirthDateTextField:)
         forControlEvents:UIControlEventValueChanged];
    [datePicker setDate:[self.dateFormat dateFromString:@"01-01-1991"]];
    [self.birthDateTextField setInputView:datePicker];
    
    self.passwordTextField = [self createTextViewWithPlaceholder:@"PASSWORD"];
    self.passwordTextField.secureTextEntry = YES;
    
    self.confirmPasswordTextField = [self createTextViewWithPlaceholder:@"CONFIRM PASSWORD"];
    self.confirmPasswordTextField.secureTextEntry = YES;
    
    self.validationMessageLabel = [UILabel new];
    self.validationMessageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.validationMessageLabel.textColor = [UIColor redColor];
    self.validationMessageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_validationMessageLabel];
    
    UIButton *createAccountButton = [[UIButton alloc] init];
    createAccountButton.translatesAutoresizingMaskIntoConstraints = NO;
    [createAccountButton addTarget:[self viewController] action:@selector(doCreateAccount) forControlEvents:UIControlEventTouchUpInside];
    [createAccountButton setTitle:@"CREATE ACCOUNT" forState:UIControlStateNormal];
    [createAccountButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    createAccountButton.backgroundColor = [TABUIUtil colorWithHex:0x0FAAD2];
    createAccountButton.layer.borderWidth = 1.0f;
    createAccountButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    createAccountButton.layer.cornerRadius = 4.0f;
    
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
    [self addSubview:_validationMessageLabel];
    // scrollView.backgroundColor = [UIColor purpleColor];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *scrollContentView = [self getScrollContentView];
    [scrollView addSubview:scrollContentView];
    
    // Add a Gesture Recognizer to dismiss the keyBoard
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:[self viewController] action:@selector(dismissKeyboardEditing)];
    // prevents the scroll view from swallowing up the touch event of child buttons
    tapGesture.cancelsTouchesInView = NO;
    [scrollView addGestureRecognizer:tapGesture];
    
    
    [self addSubview:scrollView];
    [self addSubview:_validationMessageLabel];
    [self addSubview:createAccountButton];
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView, _validationMessageLabel, createAccountButton);
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|[scrollView]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[scrollView]|"
                          options:0 metrics:nil views:viewsDictionary]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:scrollContentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:[_validationMessageLabel(20)]-[createAccountButton]-40-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[createAccountButton]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    
    // [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollContentView]|" options:0 metrics:nil views:viewsDictionary]];
}

- (UIView *) getScrollContentView {
    
    UIView *scrollContentView = [UIView new];
    // scrollContentView.backgroundColor = [UIColor greenColor];
    scrollContentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setImage:[TABImageFactory createCancelImage] forState:UIControlStateNormal];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [cancelButton addTarget:[self viewController] action:@selector(doCancel) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *createAccountLabel = [UILabel new];
    createAccountLabel.text = @"CREATE ACCOUNT";
    createAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    createAccountLabel.textAlignment = NSTextAlignmentCenter;
    
    // Add Components to Content View
    [scrollContentView addSubview:cancelButton];
    [scrollContentView addSubview:createAccountLabel];
    [scrollContentView addSubview:self.firstNameTextField];
    [scrollContentView addSubview:self.lastNameTextField];
    [scrollContentView addSubview:self.emailTextField];
    [scrollContentView addSubview:self.phoneNumberTextField];
    [scrollContentView addSubview:self.zipCodeTextField];
    [scrollContentView addSubview:self.birthDateTextField];
    [scrollContentView addSubview:self.passwordTextField];
    [scrollContentView addSubview:self.confirmPasswordTextField];
    
    // Layout the Scroll Content View
    NSDictionary *contentViewsDictionary = NSDictionaryOfVariableBindings(
                                                                          cancelButton,
                                                                          createAccountLabel,
                                                                          _firstNameTextField,
                                                                          _lastNameTextField,
                                                                          _emailTextField,
                                                                          _phoneNumberTextField,
                                                                          _zipCodeTextField,
                                                                          _birthDateTextField,
                                                                          _passwordTextField,
                                                                          _confirmPasswordTextField);
    
    // Layout Cancel Button
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-10-[cancelButton]"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:createAccountLabel attribute:NSLayoutAttributeCenterY
                                                    multiplier:1 constant:0.0]];
    
    [scrollContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[createAccountLabel(30)]-30-[_firstNameTextField(30)]-[_emailTextField(30)]-[_phoneNumberTextField(30)]-[_zipCodeTextField(30)]-[_passwordTextField(30)]-[_confirmPasswordTextField(30)]-|" options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"V:[createAccountLabel(30)]-30-[_lastNameTextField(30)]-[_emailTextField(30)]"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"V:[_phoneNumberTextField(30)]-[_birthDateTextField(30)]-[_passwordTextField(30)]"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-60-[createAccountLabel]-60-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-20-[_firstNameTextField]-[_lastNameTextField]-20-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-20-[_emailTextField]-20-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-20-[_phoneNumberTextField]-20-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-20-[_zipCodeTextField]-[_birthDateTextField]-20-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-20-[_passwordTextField]-20-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraints:[NSLayoutConstraint
                                       constraintsWithVisualFormat: @"H:|-20-[_confirmPasswordTextField]-20-|"
                                       options:0 metrics:nil views:contentViewsDictionary]];
    [scrollContentView addConstraint:[NSLayoutConstraint constraintWithItem:_firstNameTextField attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_lastNameTextField attribute:NSLayoutAttributeWidth
                                                                 multiplier:1 constant:0.0]];
    [scrollContentView addConstraint:[NSLayoutConstraint constraintWithItem:_zipCodeTextField attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_birthDateTextField attribute:NSLayoutAttributeWidth
                                                                 multiplier:1 constant:0.0]];
    
    
    return scrollContentView;
}

- (TABCreateAccountViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[TABCreateAccountViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (TABCreateAccountViewController *)responder;
}

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
    return textField;
}

-(void)updateBirthDateTextField:(UIDatePicker *)sender
{
    NSLog(@"Date Changed to : %@", sender.date);
    NSLog(@"Formatted Date : %@", [self.dateFormat stringFromDate:sender.date]);
    self.birthDateTextField.text = [self.dateFormat stringFromDate:sender.date];
}

@end
