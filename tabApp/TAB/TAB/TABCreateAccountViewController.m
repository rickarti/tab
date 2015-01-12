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
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}


// Adopted from: http://stackoverflow.com/questions/6052966/phone-number-formatting
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
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

-(void) dismissKeyboardEditing {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.view endEditing:TRUE];
}

@end
