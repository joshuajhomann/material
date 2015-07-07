//
//  TabBarViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 4/14/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController () <MDTabBarDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  [_tabBar setItems:@[ @"TAB ONE", @"THE NEXT TAB" ]];
  _tabBar.delegate = self;

  UITapGestureRecognizer *tapGesture =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(hideKeyBoard)];

  [self.view addGestureRecognizer:tapGesture];
  self.title = @"MDTabBar";
}

- (void)hideKeyBoard {
  if ([_label isFirstResponder])
    [_label resignFirstResponder];
  else if ([_index isFirstResponder])
    [_index resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
  NSString *title = _label.text;
  NSUInteger index = _index.text.integerValue;
  [_tabBar insertItem:title atIndex:index animated:_animated.on];
}

- (IBAction)replace:(id)sender {
  NSString *title = _label.text;
  NSUInteger index = _index.text.integerValue;
  [_tabBar replaceItem:title atIndex:index];
}

- (IBAction)remove:(id)sender {
  NSUInteger index = _index.text.integerValue;
  [_tabBar removeItemAtIndex:index animated:_animated.on];
}

- (IBAction)select:(id)sender {
  NSUInteger index = _index.text.integerValue;
  _tabBar.selectedIndex = index;
}

- (void)tabBar:(MDTabBar *)tabBar
    didChangeSelectedIndex:(NSUInteger)selectedIndex {
  _selectedLabel.text =
      [NSString stringWithFormat:@"Selected: %i", selectedIndex];
}
@end
