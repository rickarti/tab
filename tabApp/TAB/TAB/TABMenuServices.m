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
    
        TABContainerMenuItem *beer = [[TABContainerMenuItem alloc] initWithName:@"BEER" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *a = [[TABContainerMenuItem alloc] initWithName:@"A" menuItemType:TABContainerMenuItemTypeSection];
        TABContainerMenuItem *b = [[TABContainerMenuItem alloc] initWithName:@"B" menuItemType:TABContainerMenuItemTypeSection];
        TABContainerMenuItem *c = [[TABContainerMenuItem alloc] initWithName:@"C" menuItemType:TABContainerMenuItemTypeSection];
        beer.children = [NSArray arrayWithObjects: a, b, c, nil];
        
        TABContainerMenuItem *liquor = [[TABContainerMenuItem alloc] initWithName:@"LIQUOR" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *vodka = [[TABContainerMenuItem alloc] initWithName:@"VODKA" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *tequila = [[TABContainerMenuItem alloc] initWithName:@"TEQUILA" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *gin = [[TABContainerMenuItem alloc] initWithName:@"GIN" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *rum = [[TABContainerMenuItem alloc] initWithName:@"RUM" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *whiskey = [[TABContainerMenuItem alloc] initWithName:@"WHISKEY" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *scotch = [[TABContainerMenuItem alloc] initWithName:@"SCOTCH" menuItemType:TABContainerMenuItemTypeCategory];
        liquor.children = [NSArray arrayWithObjects: vodka, tequila, gin, rum, whiskey,scotch, nil];
        
        TABContainerMenuItem *wine = [[TABContainerMenuItem alloc] initWithName:@"WINE" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *red = [[TABContainerMenuItem alloc] initWithName:@"RED" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *white = [[TABContainerMenuItem alloc] initWithName:@"WHITE" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *sparkling = [[TABContainerMenuItem alloc] initWithName:@"SPARKLING" menuItemType:TABContainerMenuItemTypeCategory];
        wine.children = [NSArray arrayWithObjects: red, white, sparkling, nil];
        
        _topLevelMenu.children = [NSArray arrayWithObjects:beer, liquor, wine, nil];
    }
    return _topLevelMenu;
}

@end
