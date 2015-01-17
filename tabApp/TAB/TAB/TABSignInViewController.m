//
//  TABSignInViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABSignInViewController.h"
#import "TABSignInView.h"
#import "TABAccountServices.h"
#import "TABSignInModel.h"

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
    
    TABSignInModel *signInModel = [TABSignInModel new];
    signInModel.email = ((TABSignInView*)self.view).emailTextField.text;
    signInModel.password = ((TABSignInView*)self.view).passwordTextField.text;
    
    if(!signInModel.email.length>0 || !signInModel.password.length>0){
        NSLog(@"%s - Invalid Entrie(s)", __PRETTY_FUNCTION__);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Log In" message:@"Enter Email and Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    if (![[TABAccountServices new] signIn:signInModel]) {
        NSLog(@"%s - Sign in Failure", __PRETTY_FUNCTION__);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Log In" message:@"Invalid Email or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    NSLog(@"TODO: Sign in success, transition to next view");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
