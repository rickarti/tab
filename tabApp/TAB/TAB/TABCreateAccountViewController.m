//
//  TABCreateAccountViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABCreateAccountViewController.h"
#import "TABCreateAccountView.h"

@implementation TABCreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[TABCreateAccountView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(self.view){
        [((TABCreateAccountView*)self.view) configureView];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) doCancel {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Dismiss this Presented View Controller
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) doCreateAccount {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Basic Validation of Email and Zip Code and passwords match
    if ([[self createAccountView].emailTextField.text length] < 5) {
        [self createAccountView].emailTextField.text = nil;
    }
    if (![[self createAccountView].emailTextField.text containsString:@"@"]) {
        [self createAccountView].emailTextField.text = nil;
    }
    if ([[self createAccountView].zipCodeTextField.text length] != 5) {
        [self createAccountView].zipCodeTextField.text = nil;
    }
    if(![[self createAccountView].passwordTextField.text isEqualToString:[self createAccountView].confirmPasswordTextField.text]){
        [self createAccountView].passwordTextField.text = nil;
        [self createAccountView].confirmPasswordTextField.text = nil;
    }
    
    // Validate that all fields are populated
    BOOL validEntries = TRUE;
    if(![self validateField:[self createAccountView].firstNameTextField placeholderText:@"FIRST"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].lastNameTextField placeholderText:@"LAST"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].emailTextField placeholderText:@"EMAIL"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].phoneNumberTextField placeholderText:@"PHONE NUMBER"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].zipCodeTextField placeholderText:@"ZIP CODE"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].birthDateTextField placeholderText:@"DATE OF BIRTH"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].passwordTextField placeholderText:@"PASSWORD"]) {
        validEntries = FALSE;
    }
    if(![self validateField:[self createAccountView].confirmPasswordTextField placeholderText:@"CONFIRM PASSWORD"]) {
        validEntries = FALSE;
    }
    
    NSLog(@"Valid %i", validEntries);
    if(!validEntries){
        [self createAccountView].validationMessageLabel.text = @"Please review and try again";
        return;
    }
    
    // Validate the Date of Birth
    NSDate *dateOfBirth = [[self createAccountView].dateFormat dateFromString:[self createAccountView].birthDateTextField.text];
    NSLog(@"Birth Date : %@", dateOfBirth);
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:-21];
    NSDate *twentyOneYearsAgo = [gregorian dateByAddingComponents:dateComponents toDate:[NSDate new]  options:0];
    
    if ([dateOfBirth compare:twentyOneYearsAgo] == NSOrderedDescending) {
        NSLog(@"dateOfBirth is later than twentyOneYearsAgo");
        [self createAccountView].validationMessageLabel.text = @"Must be 21 years old";
        return;
    }
    [self createAccountView].validationMessageLabel.text = nil;
    
    
    
    
}

-(bool) validateField:(UITextField *) field placeholderText: (NSString *) text {
    if (!field.text.length>0) {
        UIColor *invalidColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.5];
        field.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:invalidColor }];
        return false;
    }
    return TRUE;
}



-(TABCreateAccountView *) createAccountView {
    return (TABCreateAccountView*)self.view;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.firstResponderTextField = textField;
    [self createAccountView].validationMessageLabel.text = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}


// Adopted from: http://stackoverflow.com/questions/6052966/phone-number-formatting
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Formatting the Entry in the Phone Number Field
    if (textField == ((TABCreateAccountView*)self.view).phoneNumberTextField) {
        int length = [self getLength:textField.text];
        
        if(length == 10) {
            if(range.length == 0)
                return NO;
        }
        
        if(length == 3) {
            NSString *num = [self formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) ",num];
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
        else if(length == 6) {
            NSString *num = [self formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
    }
    // Restricting the Entry in the Zip Code Field
    if (textField == ((TABCreateAccountView*)self.view).zipCodeTextField) {
        int length = [self getLength:textField.text];
        if(length == 5) {
            if(range.length == 0)
                return NO;
        }
    }
    return YES;
}

-(NSString*)formatNumber:(NSString*)phoneTextNumber
{
    phoneTextNumber = [phoneTextNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phoneTextNumber = [phoneTextNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    phoneTextNumber = [phoneTextNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    phoneTextNumber = [phoneTextNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneTextNumber = [phoneTextNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = (int)[phoneTextNumber length];
    if(length > 10) {
        phoneTextNumber = [phoneTextNumber substringFromIndex: length-10];
    }
    return phoneTextNumber;
}


-(int)getLength:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = (int)[mobileNumber length];
    return length;
}

-(void) keyboardWillShow: (NSNotification*) notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSDictionary *dic = [notification userInfo];
    CGRect keyboardRect = [[dic objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"Keyboard Rect: %@", NSStringFromCGRect(keyboardRect));
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    NSLog(@"Keyboard Rect: %@", NSStringFromCGRect(keyboardRect));
    CGRect textFieldRect = self.firstResponderTextField.frame;
    NSLog(@"Responder Rect: %@", NSStringFromCGRect(textFieldRect));
    
    NSLog(@"Keyboard Origin y: %f", keyboardRect.origin.y);
    NSLog(@"TextField Max y: %f", CGRectGetMaxX(textFieldRect));
    
    if (keyboardRect.origin.y < CGRectGetMaxX(textFieldRect)) {
        NSLog(@"Need to scroll to visible");
    }
    
}

-(void) keyboardWillHide: (NSNotification*) notification {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void) dismissKeyboardEditing {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.view endEditing:TRUE];
}

@end
