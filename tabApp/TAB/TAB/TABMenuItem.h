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
@property NSString *imageName;

-(instancetype)initWithName:(NSString*) name image:(NSString*) imageName NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithName:(NSString*) name;

@end
