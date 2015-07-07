//
//  ProgressViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 2/4/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "ProgressViewController.h"

#define ARC4RANDOM_MAX 0x100000000

@interface ProgressViewController ()

@end

@implementation ProgressViewController

float progress = 0;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  [_determinteProgress setProgress:0];
  [self performSelector:@selector(simulateProgress)
             withObject:nil
             afterDelay:.2f];
  self.title = @"MDProgress";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)simulateProgress {
  double val = (arc4random_uniform(5) + 1) / 100.f;
  progress += val;
  if (progress > 1) {
    _determinteProgress.progress = 1;
    _linearDeterminateProgress.progress = 1;
    progress = 0;
    //        _linearIndeterminateProgress.hidden = true;
    [self performSelector:@selector(simulateProgress)
               withObject:nil
               afterDelay:3.f];
  } else {
    _determinteProgress.progress = progress;
    _linearDeterminateProgress.progress = progress;
    [self performSelector:@selector(simulateProgress)
               withObject:nil
               afterDelay:.2f];
  }
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

@end
