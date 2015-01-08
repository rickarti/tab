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
    // TODO dismiss this Presented View Controller
}

@end
