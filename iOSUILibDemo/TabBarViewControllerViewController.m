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

#import "TabBarViewControllerViewController.h"
#import "iOSUILib/MDTabBarViewController.h"
#import "TabContentViewController.h"

@interface TabBarViewControllerViewController () <
    MDTabBarViewControllerDelegate>

@end

@implementation TabBarViewControllerViewController {
  MDTabBarViewController *tabBarViewController;
}

- (instancetype)init {
  if (self = [super init]) {
    [self initContent];
  }

  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
    [self initContent];
  }

  return self;
}

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil
//                         bundle:(NSBundle *)nibBundleOrNil {
//  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//    [self initContent];
//  }
//
//  return self;
//}

- (void)initContent {
  tabBarViewController = [[MDTabBarViewController alloc] initWithDelegate:self];
  NSArray *names = @[
    @"TAB ONE",
    @"TWO",
    @"TAB THREE",
    @"FOUR",
    @"FIVE",
    @"SIX",
    @"SEVEN",
    @"EIGHT",
    @"NINE",
    @"TEN"
  ];
  [tabBarViewController setItems:names];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [self addChildViewController:tabBarViewController];
  [self.view addSubview:tabBarViewController.view];
  [tabBarViewController didMoveToParentViewController:self];
  UIView *controllerView = tabBarViewController.view;
  id<UILayoutSupport> rootTopLayoutGuide = self.topLayoutGuide;
  id<UILayoutSupport> rootBottomLayoutGuide = self.bottomLayoutGuide;
  NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(
      rootTopLayoutGuide, rootBottomLayoutGuide, controllerView);

  [self.view
      addConstraints:[NSLayoutConstraint
                         constraintsWithVisualFormat:@"V:[rootTopLayoutGuide]["
                         @"controllerView][" @"rootBottomLayoutGuide]"
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]];
  [self.view
      addConstraints:[NSLayoutConstraint
                         constraintsWithVisualFormat:@"H:|[controllerView]|"
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]];

  //  tabBarViewController.selectedIndex = 3;
  self.title = @"MDTabBarViewController";
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIViewController *)tabBarViewController:
                          (MDTabBarViewController *)viewController
                     viewControllerAtIndex:(NSUInteger)index {

  TabContentViewController *controller =
      [[TabContentViewController alloc] init];
  dispatch_async(dispatch_get_main_queue(), ^{
    [controller setContent:[NSString stringWithFormat:@"Tab %d", (int)index + 1]];
  });
  return controller;
}

- (void)tabBarViewController:(MDTabBarViewController *)viewController
              didMoveToIndex:(NSUInteger)index {
}

@end
