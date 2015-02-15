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
#import "TABMenuItem.h"

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
    
    // UIImageView *itemView;
    // UITextField *itemSizeSelect;
    UIStepper *quantityStepper;
    UILabel *quantityLabel;
    // UILabel *itemCost;
    UIButton *addToTabButton;

    NSString *imageName = [self viewController].menuItem.imageName;
    
    UIImage *itemImage = [UIImage imageNamed:imageName];
    _itemView = [[UIImageView alloc] initWithImage:itemImage];
    _itemView.contentMode = UIViewContentModeCenter;
    _itemView.translatesAutoresizingMaskIntoConstraints = NO;
    // itemView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_itemView];
    
    _itemSizeSelect = [[UITextField alloc] init];
    _itemSizeSelect.translatesAutoresizingMaskIntoConstraints = NO;
    
    _itemSizeSelect.textAlignment = NSTextAlignmentCenter;
    _itemSizeSelect.text = @"12 - 12 OZ Bottles";
    _itemSizeSelect.layer.borderWidth = 1.0f;
    _itemSizeSelect.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _itemSizeSelect.layer.cornerRadius = 6.0f;
    [self addSubview:_itemSizeSelect];
    
    quantityLabel = [[UILabel alloc] init];
    quantityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    quantityLabel.textAlignment = NSTextAlignmentCenter;
    quantityLabel.text = @"1";
    [self addSubview:quantityLabel];
    
    _itemCost = [[UILabel alloc] init];
    _itemCost.translatesAutoresizingMaskIntoConstraints = NO;
    _itemCost.textAlignment = NSTextAlignmentCenter;
    _itemCost.text = @"$ 12.99";
    [self addSubview:_itemCost];
    
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
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_itemView, _itemSizeSelect, quantityLabel, quantityStepper, _itemCost, addToTabButton);

    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"V:|-90-[_itemView]-20-[_itemSizeSelect(30)]-20-[quantityStepper(30)]-30-[addToTabButton(30)]-70-|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[_itemView]-20-|"
                          options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[quantityLabel]-20-[quantityStepper]-[_itemCost]-20-|"
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
                                                        toItem:_itemCost attribute:NSLayoutAttributeCenterY
                                                    multiplier:1 constant:0.0]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat: @"H:|-20-[_itemSizeSelect]-20-|"
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
