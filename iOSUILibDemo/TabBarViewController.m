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
      [NSString stringWithFormat:@"Selected: %lu", (unsigned long)selectedIndex];
}
@end
