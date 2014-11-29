#import "TagCollectionViewController.h"
#import "TagCollectionDataSource.h"
#import "TagCollectionViewModel.h"
#import "TagCell.h"
#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import <CompactConstraint/UIView+CompactConstraint.h>

// private interface:
@interface TagCollectionViewController () <UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) TagCollectionViewModel *viewModel;
@property (nonatomic, strong) TagCollectionDataSource *dataSource;

- (NSDictionary *)views;
- (void)configureViews;
- (void)placeViews;
- (void)constrainViews;
@end

@implementation TagCollectionViewController{
    TagCell *_sizingCell;
}

- (instancetype)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _viewModel = [[TagCollectionViewModel alloc] init];
        _dataSource = [[TagCollectionDataSource alloc] initWithViewModel:_viewModel];
        [_dataSource setDelegate:self];

        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.sectionInset = UIEdgeInsetsMake(2,2,2,2);
        flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;

        _collectionView= [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];

        _collectionView.delegate = self;
        _collectionView.dataSource = _dataSource;
        _collectionView.backgroundColor = [UIColor whiteColor];

        [_dataSource registerCellTypesForCollectionView:_collectionView];

        _sizingCell = [[TagCell alloc] initWithFrame:CGRectZero];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"TagCollectionViewController"];

    [self configureViews];
    [self placeViews];
    [self constrainViews];
}

#pragma mark AutoLayout:
- (NSDictionary *)views {
    return NSDictionaryOfVariableBindings (
        _collectionView
    );
}

- (void)configureViews {
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self.collectionView setBackgroundColor:[UIColor grayColor]];
    [self.collectionView setScrollEnabled:YES];
}

- (void)placeViews {
    [self.views.allValues each:^(UIView *childView) {
        [childView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:childView];
    }];
}

- (void)constrainViews {
    NSDictionary *metrics = @{
        @"collectionview_height": @(35)
    };

    [self.view addCompactConstraints:@[
        @"_collectionView.top= super.top+ 100",
        @"_collectionView.left=super.left",
        @"_collectionView.right=super.right",
        @"_collectionView.height= collectionview_height",

    ] metrics:metrics views:self.views];
}

#pragma mark- UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    // a cheat http://www.cocoanetics.com/2013/08/variable-sized-items-in-uicollectionview/
    [self.dataSource configureCell:_sizingCell forIndexPath:indexPath];

    CGSize size= [_sizingCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size;
}

@end