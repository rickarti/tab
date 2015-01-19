//
//  TABMapViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/17/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMapViewController.h"
#import "TABMapView.h"

@interface TABMapViewController ()

@end

@implementation TABMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[TABMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(self.view){
        [((TABMapView*)self.view) configureView];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}

-(void) doCancel {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void) doSetLocation {
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
