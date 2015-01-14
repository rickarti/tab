//
//  TABAccountServices.m
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABAccountServices.h"

@implementation TABAccountServices

-(BOOL) signIn: (TABSignInModel *) signInModel {
 
    return TRUE;
}

-(BOOL) accountExists: (TABCreateAccountModel *) account {
    
    return TRUE;
}

-(BOOL) createAccount: (TABCreateAccountModel *) account {
    
    return TRUE;
}

-(TABCreateAccountModel *) getAccount: (NSString *) email {
   
    return nil;
}

@end
