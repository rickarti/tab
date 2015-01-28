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

-(TABContainerMenuItem *) getTopLevelMenu {
    
    TABContainerMenuItem *topLevelMenu = [[TABContainerMenuItem alloc] init];
    
    TABContainerMenuItem *beer = [[TABContainerMenuItem alloc] init];
    TABContainerMenuItem *wine = [[TABContainerMenuItem alloc] init];
    TABContainerMenuItem *liquor = [[TABContainerMenuItem alloc] init];
    
    beer.name = @"BEER";
    wine.name = @"WINE";
    liquor.name = @"LIQUOR";
    
    topLevelMenu.children = [NSArray arrayWithObjects:beer, wine, liquor, nil];
   
    return topLevelMenu;
}

@end
