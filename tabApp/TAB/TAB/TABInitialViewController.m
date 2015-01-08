//
//  TABInitialViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABInitialViewController.h"
#import "TABInitialView.h"

@implementation TABInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[TABInitialView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(self.view){
        [((TABInitialView*)self.view) configureView];
    }
}

-(void) doSignIn {
    // TODO : present Sign In View Controller
}

-(void) doCreateAccount {
    // TODO : present Create Account View Controller
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
