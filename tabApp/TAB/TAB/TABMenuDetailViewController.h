//
//  TABMenuDetailViewController.h
//  TAB
//
//  Created by Rick Johnson on 2/1/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TABMenuItem;

@interface TABMenuDetailViewController : UIViewController

@property TABMenuItem* menuItem;

-(instancetype)initWithMenuItem:(TABMenuItem*) item NS_DESIGNATED_INITIALIZER;

-(void) doAddToTab;

@end
