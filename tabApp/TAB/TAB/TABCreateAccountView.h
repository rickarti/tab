//
//  TABCreateAccountView.h
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TABCreateAccountView : UIView

@property NSDateFormatter *dateFormat;
@property UITextField *firstNameTextField;
@property UITextField *lastNameTextField;
@property UITextField *emailTextField;
@property UITextField *phoneNumberTextField;
@property UITextField *zipCodeTextField;
@property UITextField *birthDateTextField;
@property UITextField *passwordTextField;
@property UITextField *confirmPasswordTextField;
@property UILabel *validationMessageLabel;

- (void)configureView;

@end
