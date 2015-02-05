//
//  TABContainerMenuItem.h
//  TAB
//
//  Created by Rick Johnson on 1/25/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

// POST : How to define a typedef Enumerated Value
typedef NS_ENUM(NSInteger, TABMenuItemType) {
    TABContainerMenuItemTypeCategory,
    TABContainerMenuItemTypeSection,
    TABContainerMenuItemTypeItem
};

@interface TABContainerMenuItem : NSObject

@property NSString *name;
@property NSArray *children;
@property TABMenuItemType type;


-(instancetype)initWithName:(NSString*) name;
-(instancetype)initWithName:(NSString*) name menuItemType:(TABMenuItemType) type;
-(instancetype)initWithName:(NSString*) name menuItemType:(TABMenuItemType) type children:(NSArray*)children NS_DESIGNATED_INITIALIZER;

@end

