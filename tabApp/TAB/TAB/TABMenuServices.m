//
//  TABMenuServices.m
//  TAB
//
//  Created by Rick Johnson on 1/27/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuServices.h"
#import "TABContainerMenuItem.h"

@implementation TABMenuServices

+ (id)sharedService {
    static TABMenuServices *sharedService = nil;
    @synchronized(self) {
        if (sharedService == nil)
            sharedService = [[self alloc] init];
    }
    return sharedService;
}

-(TABContainerMenuItem *) getTopLevelMenu {
    
    if (!self.topLevelMenu) {

        _topLevelMenu = [[TABContainerMenuItem alloc] init];
    
        TABContainerMenuItem *beer = [[TABContainerMenuItem alloc] init];
        TABContainerMenuItem *wine = [[TABContainerMenuItem alloc] init];
        TABContainerMenuItem *liquor = [[TABContainerMenuItem alloc] init];
    
        beer.name = @"BEER";
        wine.name = @"WINE";
        liquor.name = @"LIQUOR";
    
        _topLevelMenu.children = [NSArray arrayWithObjects:beer, wine, liquor, nil];
    }
    return _topLevelMenu;
}

@end
