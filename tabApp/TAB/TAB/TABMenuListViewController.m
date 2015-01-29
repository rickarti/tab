//
//  TABMenuListViewController.m
//  TAB
//
//  Created by Rick Johnson on 1/26/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuListViewController.h"
#import "TABContainerMenuItem.h"

@interface TABMenuListViewController ()

@end

@implementation TABMenuListViewController

-(instancetype)initWithMenuItem:(TABContainerMenuItem*) item {
    self = [super init];
    if (self) {
        self.containerMenuItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *logoTitleImage = [UIImage imageNamed:@"TabLogoNavigationTitle"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:logoTitleImage];
    self.tableView.dataSource = self;
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
    
    TABContainerMenuItem *item = [self.containerMenuItem.children objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.name;
    
    // POST : How to show the disclosure Chevron in a UITableViewCell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //TABMenuServices *menuServices = [TABMenuServices sharedService];
    return self.containerMenuItem.children.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    TABContainerMenuItem* selectedMenuItem = [self.containerMenuItem.children objectAtIndex:indexPath.row];
    TABMenuListViewController *menuListViewController = [[TABMenuListViewController alloc] initWithMenuItem:selectedMenuItem];
    [self.navigationController pushViewController:menuListViewController animated:YES];
}



@end
