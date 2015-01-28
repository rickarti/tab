//
//  TABMenuListView.m
//  TAB
//
//  Created by Rick Johnson on 1/26/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuListView.h"

@implementation TABMenuListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configureView {
    self.topView = [UIView new];
    self.tableView = [UITableView new];
    
    self.topView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;

    self.topView.backgroundColor = [UIColor darkGrayColor];
    
    [self addSubview:_topView];
    [self addSubview:_tableView];
    
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_topView, _tableView);
    
    // Vertical Layout
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_topView(60)]" options:0 metrics:nil views:viewsDictionary]];
    
    // Horizontal Layout
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|[_topView]|"
                          options:0 metrics:nil views:viewsDictionary]];
//    [self addConstraints:[NSLayoutConstraint
//                          constraintsWithVisualFormat: @"H:|[_tableView]|"
//                          options:0 metrics:nil views:viewsDictionary]];
    
}

@end
