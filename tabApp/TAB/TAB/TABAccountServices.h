//
//  TABAccountServices.h
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TABCreateAccountModel;
@class TABSignInModel;

@interface TABAccountServices : NSObject

-(BOOL) signIn: (TABSignInModel *) signInModel;

-(BOOL) accountExists: (NSString *) path;

-(BOOL) createAccount: (TABCreateAccountModel *) account;

-(TABCreateAccountModel *) getAccount: (NSString *) email;

@end
