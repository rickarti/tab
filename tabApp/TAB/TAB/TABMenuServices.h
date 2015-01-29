//
//  TABMenuServices.h
//  TAB
//
//  Created by Rick Johnson on 1/27/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TABContainerMenuItem;

@interface TABMenuServices : NSObject

@property TABContainerMenuItem *topLevelMenu;

+ (id)sharedService;

-(TABContainerMenuItem *) getTopLevelMenu;

@end
