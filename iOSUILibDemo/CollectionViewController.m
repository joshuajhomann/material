// The MIT License (MIT)
//
// Copyright (c) 2015 FPT Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
  UICollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                forIndexPath:indexPath];
  UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
  [titleLabel setText:cellData];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"did select item at %li:%li", (long)indexPath.section, (long)indexPath.row);
}

@end
