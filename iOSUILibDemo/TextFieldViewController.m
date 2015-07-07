//
//  TextFieldViewController.m
//  iOSUILibDemo
//
//  Created by Public on 3/25/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "TextFieldViewController.h"
#import "NormalTextFieldViewController.h"
#import "FullWidthTextFieldViewController.h"

@interface TextFieldViewController () <MDTabBarViewControllerDelegate>

@end

@implementation TextFieldViewController {
  MDTabBarViewController *tabBarViewController;
  NormalTextFieldViewController *normalTextFieldViewController;
  FullWidthTextFieldViewController *fullWidthTextFieldViewController;
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

- (void)initContent {
  tabBarViewController = [[MDTabBarViewController alloc] initWithDelegate:self];
  NSArray *names = @[
    @"NORMAL",
    @"FULL WIDTH",
  ];
  [tabBarViewController setItems:names];
  normalTextFieldViewController = [[NormalTextFieldViewController alloc] init];
  fullWidthTextFieldViewController =
      [[FullWidthTextFieldViewController alloc] init];
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
  self.title = @"MDTextField";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIViewController *)tabBarViewController:
                          (MDTabBarViewController *)viewController
                     viewControllerAtIndex:(NSUInteger)index {

  UIViewController *controller = (index == 0)
                                     ? normalTextFieldViewController
                                     : fullWidthTextFieldViewController;
  return controller;
}

@end
