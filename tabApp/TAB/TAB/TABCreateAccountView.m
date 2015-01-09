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
    
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setImage:[TABImageFactory createCancelImage] forState:UIControlStateNormal];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [cancelButton addTarget:[self viewController] action:@selector(doCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    
    UILabel *createAccountLabel = [UILabel new];
    createAccountLabel.text = @"CREATE ACCOUNT";
    createAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    createAccountLabel.textAlignment = NSTextAlignmentCenter;
    
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
    
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor purpleColor];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *scrollContentView = [UIView new];
    scrollContentView.backgroundColor = [UIColor yellowColor];
    scrollContentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:scrollView];
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView, scrollContentView);
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|[scrollView]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[scrollView]|"
                          options:0 metrics:nil views:viewsDictionary]];
    
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}

@end
