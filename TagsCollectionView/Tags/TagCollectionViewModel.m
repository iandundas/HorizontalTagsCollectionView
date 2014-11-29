//
// Created by Ian Dundas on 29/11/14.
// Copyright (c) 2014 Ian Dundas. All rights reserved.
//

#import "TagCollectionViewModel.h"

// private interface:
@interface TagCollectionViewModel ()
@property(nonatomic, retain) NSArray *tags;
@end

@implementation TagCollectionViewModel
-(instancetype)init{
    if (self = [super init]) {
        _tags= @[
            @"Red", @"Green", @"Neon-Blue", @"Orange", @"Brown",
            @"Black", @"White", @"Whoa-shit Purple", @"Grey", @"Silver",
            @"Gold", @"Chalk"];
    }
    return self;
}
@end
