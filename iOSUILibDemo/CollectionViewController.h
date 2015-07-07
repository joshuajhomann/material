//
//  CollectionViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 4/6/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController
    : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property(weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic, strong) NSArray *dataArray;

@end
