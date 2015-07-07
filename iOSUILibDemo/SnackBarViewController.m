//
//  SnackBarViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 5/28/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "iOSUILib/MDSnackbar.h"
#import "SnackBarViewController.h"
#import "iOSUILib/UIColorHelper.h"

@interface SnackBarViewController ()

@end

@implementation SnackBarViewController {
  //  MDSnackbar *snackbar;
  int count;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  //  snackbar = [[MDSnackbar alloc]
  //      initWithText:@"Connection time out. Test for long message."
  //       actionTitle:@"retry"];
  //  snackbar.multiline = true;
  //  snackbar.actionTitleColor = [UIColorHelper colorWithRGBA:@"#4CAF50"];
  self.title = @"MDSnackbar";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchUpInside:(id)sender {

  MDSnackbar *snackbar = [[MDSnackbar alloc]
      initWithText:
          [NSString
              stringWithFormat:@"Connection time out. Test for long message.%i",
                               count++]
       actionTitle:@"retry"];
  snackbar.actionTitleColor = [UIColorHelper colorWithRGBA:@"#4CAF50"];
  snackbar.multiline = (count % 2 == 0);
  [snackbar show];
}
@end
