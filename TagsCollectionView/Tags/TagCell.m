//
// Created by Ian Dundas on 29/11/14.
// Copyright (c) 2014 Ian Dundas. All rights reserved.
//

#import <CompactConstraint/UIView+CompactConstraint.h>
#import "TagCell.h"
#import "NSArray+ObjectiveSugar.h"

// private interface:
@interface TagCell ()
@end

@implementation TagCell
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        self.label= [UILabel new];

        [self configureViews];
        [self placeViews];
        [self constrainViews];
    }
    return self;
}

-(NSDictionary*)views{
    return NSDictionaryOfVariableBindings(
        _label
    );
}

- (void)configureViews {
    [self setBackgroundColor:[UIColor redColor]];

    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setCornerRadius:5];

    [self.label setTextColor:[UIColor blackColor]];
    [self.label setFont:[UIFont fontWithName:@"Futura-Medium" size:18]];
}

- (void)placeViews {
    [self.views.allValues each:^(UIView *view) {
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:view];
    }];
}

- (void)constrainViews {
    NSDictionary *metrics = @{};

    [self.contentView addCompactConstraints:@[
        @"_label.right = super.right",
        @"_label.left = super.left",
        @"_label.centerY = super.centerY",
        @"_label.height = super.height",

    ] metrics:metrics views:self.views];
}
@end