//
//  TABCreateAccountViewController.h
//  TAB
//
//  Created by Rick Johnson on 1/8/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TABCreateAccountViewController : UIViewController <UITextFieldDelegate>

@property UITextField *firstResponderTextField;

-(void) doCancel;

-(void) doCreateAccount;

-(void) dismissKeyboardEditing;

-(void) keyboardWillShow: (NSNotification*) notification;

-(void) keyboardWillHide: (NSNotification*) notification;

@end
