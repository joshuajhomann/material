//
//  FullWidthTextFieldViewController.m
//  iOSUILibDemo
//
//  Created by Public on 3/25/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "FullWidthTextFieldViewController.h"

@interface FullWidthTextFieldViewController ()

@end

@implementation FullWidthTextFieldViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view addConstraint:[NSLayoutConstraint
                               constraintWithItem:_containerView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                       multiplier:1
                                         constant:0]];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(dismissKeyboard)];

  [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard {
  [self.view endEditing:YES];
}
@end
