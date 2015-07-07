//
//  CollectionViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 4/6/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "CollectionViewController.h"
#import "iOSUILib/MDCollectionViewCell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSMutableArray *firstSection = [[NSMutableArray alloc] init];
  for (int i = 0; i < 50; i++) {
    [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
  }
  self.dataArray = [[NSArray alloc] initWithObjects:firstSection, nil];

  UINib *cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
  [self.collectionView registerNib:cellNib
        forCellWithReuseIdentifier:@"cvCell"];

  float cellWidth = (self.view.frame.size.width - 10) / 2;

  UICollectionViewFlowLayout *flowLayout =
      [[UICollectionViewFlowLayout alloc] init];
  [flowLayout setItemSize:CGSizeMake(cellWidth, cellWidth)];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

  [self.collectionView setCollectionViewLayout:flowLayout];
  self.title = @"MDCollectionView";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:
    (UICollectionView *)collectionView {
  return [self.dataArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
  return [sectionArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
  NSString *cellData = [data objectAtIndex:indexPath.row];
  static NSString *cellIdentifier = @"cvCell";
  MDCollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                forIndexPath:indexPath];
  UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
  [titleLabel setText:cellData];
  return cell;
}

@end
