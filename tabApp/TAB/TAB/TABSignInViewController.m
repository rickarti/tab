//
//  TABSignInViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABSignInViewController.h"
#import "TABSignInView.h"

@implementation TABSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[TABSignInView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(self.view){
        [((TABSignInView*)self.view) configureView];
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

-(void) doSignIn {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if(![((TABSignInView*)self.view).emailTextField.text length]>0 || ![((TABSignInView*)self.view).passwordTextField.text length]>0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Log In" message:@"Enter Email and Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    } else {
        // TODO: Actually Call the Service and check : async call with callback in UIThread
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Log In" message:@"Invalid Email or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
