//
//  TABCreateAccountModel.h
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TABSignInModel.h"

@interface TABCreateAccountModel : TABSignInModel

@property NSString *firstName;
@property NSString *lastName;
@property NSString *phoneNumber;
@property NSString *zipCode;
@property NSDate *dateOfBirth;

@end
