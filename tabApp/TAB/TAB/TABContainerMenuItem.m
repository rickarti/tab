//
//  TABContainerMenuItem.m
//  TAB
//
//  Created by Rick Johnson on 1/25/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABContainerMenuItem.h"

@implementation TABContainerMenuItem

-(instancetype)initWithName:(NSString*) name {
    return [self initWithName:name menuItemType:TABContainerMenuItemTypeCategory];
}

-(instancetype)initWithName:(NSString*) name menuItemType:(TABMenuItemType) type {
    return [self initWithName:name menuItemType:type children:nil];
}

-(instancetype)initWithName:(NSString*) name menuItemType:(TABMenuItemType) type children:(NSArray*) children {
    self = [super init];
    if (self) {
        _name = name;
        _type = type;
        _children = children;
    }
    return self;
}

@end
