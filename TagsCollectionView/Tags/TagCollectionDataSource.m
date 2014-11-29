//
// Created by Ian Dundas on 29/11/14.
// Copyright (c) 2014 Ian Dundas. All rights reserved.
//

#import "TagCollectionDataSource.h"
#import "TagCell.h"
#import "TagCollectionViewModel.h"

static NSString *CellIdentifier = @"TagCollectionViewControllerCell";

// private interface:
@interface TagCollectionDataSource ()
@property (nonatomic, strong) TagCollectionViewModel *viewModel;
@end

@implementation TagCollectionDataSource
- (id)initWithViewModel:(TagCollectionViewModel *)model {
    if (self = [super init]) {
        _viewModel= model;
    }
    return self;
}

- (void)registerCellTypesForCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[TagCell class] forCellWithReuseIdentifier:CellIdentifier];
}

#pragma mark - UICollectionViewDataSource Methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.tags.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UICollectionViewCell*)cell forIndexPath:(NSIndexPath*)indexPath{
    TagCell *cell_ = (TagCell*)cell;
    [cell_.label setText:self.viewModel.tags[(NSUInteger) indexPath.row]];
}

@end