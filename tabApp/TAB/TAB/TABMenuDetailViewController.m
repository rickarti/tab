//
//  TABMenuDetailViewController.m
//  TAB
//
//  Created by Rick Johnson on 2/1/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuDetailViewController.h"
#import "TABMenuDetailView.h"
#import "TABMenuItem.h"

@interface TABMenuDetailViewController ()

@end

@implementation TABMenuDetailViewController

-(instancetype)initWithMenuItem:(TABMenuItem*) item {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self = [super init];
    
    if (self) {
        self.view = [[TABMenuDetailView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        // TODO Adjust bounds for the Navigation Bar and Toolbar
        
        self.view.backgroundColor = [UIColor whiteColor];
        [(TABMenuDetailView*)self.view configureView];
        self.menuItem = item;
        self.navigationItem.title = item.name;
    }
    NSLog(@"%s : bounds:%@", __PRETTY_FUNCTION__, NSStringFromCGRect(self.view.bounds));
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s : %@", __PRETTY_FUNCTION__, self.view);
    // self.view.navigationItem.title = self.menuItem.name;
}

-(void) doAddToTab {
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
