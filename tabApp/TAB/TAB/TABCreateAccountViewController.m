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
    // Dismiss this Presented View Controller
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
