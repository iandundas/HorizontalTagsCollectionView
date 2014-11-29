//
// Created by Ian Dundas on 29/11/14.
// Copyright (c) 2014 Ian Dundas. All rights reserved.
//


@import UIKit;
@class TagCollectionViewController;
@class TagCollectionViewModel;

@interface TagCollectionDataSource : NSObject <UICollectionViewDataSource>
@property (nonatomic, weak) TagCollectionViewController *delegate;

- (void)registerCellTypesForCollectionView:(UICollectionView *)collectionView;
- (void)configureCell:(UICollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
- (id)initWithViewModel:(TagCollectionViewModel *)model;
@end