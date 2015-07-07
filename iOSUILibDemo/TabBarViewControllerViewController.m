//
//  TabBarViewControllerViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 5/18/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

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
    [controller setContent:[NSString stringWithFormat:@"Tab %i", index + 1]];
  });
  return controller;
}

- (void)tabBarViewController:(MDTabBarViewController *)viewController
              didMoveToIndex:(NSUInteger)index {
}

@end
