//
//  ToastViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 6/2/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "ToastViewController.h"
#import "iOSUILib/MDToast.h"

@interface ToastViewController ()

@end

@implementation ToastViewController {
  int count;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.title = @"MDToast";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)singleLineToastTouchedUpInSide:(id)sender {
  MDToast *toast = [[MDToast alloc]
      initWithText:[NSString
                       stringWithFormat:@"Toast test message %i.", count++]
          duration:kMDToastDurationShort];
  [toast show];
}

- (IBAction)longToastTouchedUpInSide:(id)sender {
  MDToast *toast = [[MDToast alloc]
      initWithText:[NSString stringWithFormat:@"Attention! This is a very, "
                                              @"very long test message.  %i",
                                              count++]
          duration:kMDToastDurationShort];
  [toast show];
}
@end
