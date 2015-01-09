//
//  TABInitialViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABInitialViewController.h"
#import "TABInitialView.h"
#import "TABSignInViewController.h"
#import "TABCreateAccountViewController.h"

@implementation TABInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[TABInitialView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(self.view){
        [((TABInitialView*)self.view) configureView];
    }
}

-(void) doSignIn {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Present Sign In View Controller
    [self presentViewController:[TABSignInViewController new] animated:YES completion:nil];
}

-(void) doCreateAccount {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Present Create Account View Controller
    [self presentViewController:[TABCreateAccountViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
