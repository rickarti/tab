//
//  TABMenuItem.h
//  TAB
//
//  Created by Rick Johnson on 1/29/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TABMenuItem : NSObject

@property NSString *name;

-(instancetype)initWithName:(NSString*) name NS_DESIGNATED_INITIALIZER;

@end
