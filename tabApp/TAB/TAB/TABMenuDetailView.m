//
//  TABMenuDetailView.m
//  TAB
//
//  Created by Rick Johnson on 2/1/15.
//  Copyright (c) 2015 Okidok Studios. All rights reserved.
//

#import "TABMenuDetailView.h"
#import "TABMenuDetailViewController.h"
#import "TABUIUtil.h"

@implementation TABMenuDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configureView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
//    self.autoresizingMask = (UIViewAutoresizingFlexibleHeight |
//                             UIViewAutoresizingFlexibleTopMargin |
//                             UIViewAutoresizingFlexibleBottomMargin);
    
    UIImageView *itemView;
    UITextField *itemSizeSelect;
    UIStepper *quantityStepper;
    UILabel *quantityLabel;
    UILabel *itemCost;
    UIButton *addToTabButton;

    UIImage *itemImage = [UIImage imageNamed:@"beer"];
    itemView = [[UIImageView alloc] initWithImage:itemImage];
    itemView.contentMode = UIViewContentModeCenter;
    itemView.translatesAutoresizingMaskIntoConstraints = NO;
    // itemView.backgroundColor = [UIColor orangeColor];
    [self addSubview:itemView];
    
    itemSizeSelect = [[UITextField alloc] init];
    itemSizeSelect.translatesAutoresizingMaskIntoConstraints = NO;
    
    itemSizeSelect.textAlignment = NSTextAlignmentCenter;
    itemSizeSelect.text = @"12 - 12 OZ Bottles";
    itemSizeSelect.layer.borderWidth = 1.0f;
    itemSizeSelect.layer.borderColor = [UIColor lightGrayColor].CGColor;
    itemSizeSelect.layer.cornerRadius = 6.0f;
    [self addSubview:itemSizeSelect];
    
    quantityLabel = [[UILabel alloc] init];
    quantityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    quantityLabel.textAlignment = NSTextAlignmentCenter;
    quantityLabel.text = @"1";
    [self addSubview:quantityLabel];
    
    itemCost = [[UILabel alloc] init];
    itemCost.translatesAutoresizingMaskIntoConstraints = NO;
    itemCost.textAlignment = NSTextAlignmentCenter;
    itemCost.text = @"$ 12.99";
    [self addSubview:itemCost];
    
    quantityStepper = [[UIStepper alloc] init];
    quantityStepper.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:quantityStepper];
    
    addToTabButton = [[UIButton alloc] init];
    addToTabButton.translatesAutoresizingMaskIntoConstraints = NO;
    [addToTabButton addTarget:[self viewController] action:@selector(doAddToTab) forControlEvents:UIControlEventTouchUpInside];
    [addToTabButton setTitle:@"ADD TO TAB" forState:UIControlStateNormal];
    [addToTabButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    addToTabButton.backgroundColor = [TABUIUtil colorWithHex:0x0FAAD2];
    addToTabButton.layer.borderWidth = 1.0f;
    addToTabButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    addToTabButton.layer.cornerRadius = 4.0f;
    [self addSubview:addToTabButton];
    
    
    
    
    
    // Layout Components
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(itemView, itemSizeSelect, quantityLabel, quantityStepper, itemCost, addToTabButton);
    
    // Layout Cancel Button
//    [self addConstraints:[NSLayoutConstraint
//                          constraintsWithVisualFormat: @"H:|-10-[cancelButton]"
//                          options:0 metrics:nil views:viewsDictionary]];
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:cancelButton attribute:NSLayoutAttributeCenterY
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:signInLabel attribute:NSLayoutAttributeCenterY
//                                                    multiplier:1 constant:0.0]];
    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[signInLabel(30)]-30-[_emailTextField(30)]-20-[_passwordTextField(30)]" options:0 metrics:nil views:viewsDictionary]];
//    [self addConstraints:[NSLayoutConstraint
//                          constraintsWithVisualFormat: @"H:|-60-[signInLabel]-60-|"
//                          options:0 metrics:nil views:viewsDictionary]];
//    [self addConstraints:[NSLayoutConstraint
//                          constraintsWithVisualFormat: @"H:|-20-[_emailTextField]-20-|"
//                          options:0 metrics:nil views:viewsDictionary]];
//    [self addConstraints:[NSLayoutConstraint
//                          constraintsWithVisualFormat: @"H:|-20-[_passwordTextField]-20-|"
//                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|-90-[itemView]-20-[itemSizeSelect(30)]-20-[quantityStepper(30)]-30-[addToTabButton(30)]-70-|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[itemView]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[quantityLabel]-20-[quantityStepper]-[itemCost]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:quantityStepper attribute:NSLayoutAttributeCenterX
                                                              multiplier:1 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:quantityStepper attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:quantityLabel attribute:NSLayoutAttributeCenterY
                                                    multiplier:1 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:quantityStepper attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:itemCost attribute:NSLayoutAttributeCenterY
                                                    multiplier:1 constant:0.0]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[itemSizeSelect]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[addToTabButton]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
}


- (TABMenuDetailViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[TABMenuDetailViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (TABMenuDetailViewController *)responder;
}

@end
