//
//  TABMenuDetailView.h
//  TAB
//
//  Created by Rick Johnson on 2/1/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TABMenuDetailView : UIView

@property UIImageView *itemView;
@property UITextField *itemSizeSelect;
@property UILabel *itemCost;

- (void)configureView;

@end
