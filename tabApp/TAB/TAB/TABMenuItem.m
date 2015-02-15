//
//  TABMenuItem.m
//  TAB
//
//  Created by Rick Johnson on 1/29/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuItem.h"

@implementation TABMenuItem

-(instancetype)initWithName:(NSString*) name image:(NSString*) imageName {
    self = [super init];
    if (self) {
        _name = name;
        _imageName = imageName;
    }
    return self;
}

-(instancetype)initWithName:(NSString*) name {
    return [self initWithName:name image:nil];
}

@end
