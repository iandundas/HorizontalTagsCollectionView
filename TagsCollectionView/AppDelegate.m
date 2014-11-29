//
//  AppDelegate.m
//  TagsCollectionView
//
//  Created by Ian Dundas on 29/11/14.
//  Copyright (c) 2014 Ian Dundas. All rights reserved.
//

#import "AppDelegate.h"
#import "TagCollectionViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    TagCollectionViewController *tagCollectionViewController = [TagCollectionViewController new];
    [self.window setRootViewController:tagCollectionViewController];

    [self.window makeKeyAndVisible];
    return YES;
}
@end