//
//  TABMenuListView.h
//  TAB
//
//  Created by Rick Johnson on 1/26/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TABMenuListView : UIView

@property UIView *topView;
@property UITableView *tableView;

- (void)configureView;

@end
