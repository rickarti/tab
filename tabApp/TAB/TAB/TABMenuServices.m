//
//  TABMenuServices.m
//  TAB
//
//  Created by Rick Johnson on 1/27/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuServices.h"
#import "TABContainerMenuItem.h"
#import "TABMenuItem.h"

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

        // Build Top Menu Page
        _topLevelMenu = [[TABContainerMenuItem alloc] init];
        TABContainerMenuItem *topLevelSection = [[TABContainerMenuItem alloc] initWithName:nil menuItemType:TABContainerMenuItemTypeSection];
        _topLevelMenu.children = [NSArray arrayWithObjects:topLevelSection, nil];
        
        TABContainerMenuItem *beer = [[TABContainerMenuItem alloc] initWithName:@"BEER" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *liquor = [[TABContainerMenuItem alloc] initWithName:@"LIQUOR" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *wine = [[TABContainerMenuItem alloc] initWithName:@"WINE" menuItemType:TABContainerMenuItemTypeCategory];
        topLevelSection.children = [NSArray arrayWithObjects:beer, liquor, wine, nil];
    
        // Build Beer Page
        TABContainerMenuItem *sectionA = [[TABContainerMenuItem alloc] initWithName:@"A" menuItemType:TABContainerMenuItemTypeSection];
        TABContainerMenuItem *sectionB = [[TABContainerMenuItem alloc] initWithName:@"B" menuItemType:TABContainerMenuItemTypeSection];
        TABContainerMenuItem *sectionC = [[TABContainerMenuItem alloc] initWithName:@"C" menuItemType:TABContainerMenuItemTypeSection];
        beer.children = [NSArray arrayWithObjects: sectionA, sectionB, sectionC, nil];
        
        TABMenuItem *arrBas = [[TABMenuItem alloc] initWithName:@"Arrogant Bastard"];
        sectionA.children = [NSArray arrayWithObjects: arrBas, nil];
        TABMenuItem *bud = [[TABMenuItem alloc] initWithName:@"Budweiser"];
        sectionB.children = [NSArray arrayWithObjects: bud, nil];
        TABMenuItem *coors = [[TABMenuItem alloc] initWithName:@"Coors"];
        sectionC.children = [NSArray arrayWithObjects: coors, nil];
        
        TABContainerMenuItem *liquorSection = [[TABContainerMenuItem alloc] initWithName:nil menuItemType:TABContainerMenuItemTypeSection];
        TABContainerMenuItem *vodka = [[TABContainerMenuItem alloc] initWithName:@"VODKA" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *tequila = [[TABContainerMenuItem alloc] initWithName:@"TEQUILA" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *gin = [[TABContainerMenuItem alloc] initWithName:@"GIN" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *rum = [[TABContainerMenuItem alloc] initWithName:@"RUM" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *whiskey = [[TABContainerMenuItem alloc] initWithName:@"WHISKEY" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *scotch = [[TABContainerMenuItem alloc] initWithName:@"SCOTCH" menuItemType:TABContainerMenuItemTypeCategory];
        liquorSection.children = [NSArray arrayWithObjects: vodka, tequila, gin, rum, whiskey,scotch, nil];
        liquor.children = [NSArray arrayWithObjects: liquorSection, nil];
        
        TABContainerMenuItem *wineSection = [[TABContainerMenuItem alloc] initWithName:nil menuItemType:TABContainerMenuItemTypeSection];
        TABContainerMenuItem *red = [[TABContainerMenuItem alloc] initWithName:@"RED" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *white = [[TABContainerMenuItem alloc] initWithName:@"WHITE" menuItemType:TABContainerMenuItemTypeCategory];
        TABContainerMenuItem *sparkling = [[TABContainerMenuItem alloc] initWithName:@"SPARKLING" menuItemType:TABContainerMenuItemTypeCategory];
        wineSection.children = [NSArray arrayWithObjects: red, white, sparkling, nil];
        wine.children = [NSArray arrayWithObjects: wineSection, nil];
        
        _topLevelMenu.children = [NSArray arrayWithObjects:topLevelSection, nil];
    }
    return _topLevelMenu;
}

@end
