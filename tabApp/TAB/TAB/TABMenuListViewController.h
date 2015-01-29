//
//  TABMenuListViewController.h
//  TAB
//
//  Created by Rick Johnson on 1/26/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TABContainerMenuItem;

@interface TABMenuListViewController : UITableViewController

@property TABContainerMenuItem* containerMenuItem;

-(instancetype)initWithMenuItem:(TABContainerMenuItem*) item NS_DESIGNATED_INITIALIZER;

@end
