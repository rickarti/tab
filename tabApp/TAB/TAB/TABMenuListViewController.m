//
//  TABMenuListViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/26/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuListViewController.h"
#import "TABMenuServices.h"
#import "TABContainerMenuItem.h"

@interface TABMenuListViewController ()

@end

@implementation TABMenuListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *logoTitleImage = [UIImage imageNamed:@"TabLogoNavigationTitle"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:logoTitleImage];
    //UITableView *tableView = [UITableView new];
    self.tableView.dataSource = self;
    // self.view = tableView; // [[TABMenuListView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    if(self.view){
//        [((TABMenuListView*)self.view) configureView];
//    }
    // Do any additional setup after loading the view.
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

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    TABMenuServices *menuServices = [TABMenuServices new];
    TABContainerMenuItem *item = [[menuServices getTopLevelMenu].children objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.name;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TABMenuServices *menuServices = [TABMenuServices new];
    return [menuServices getTopLevelMenu].children.count;
}

@end
