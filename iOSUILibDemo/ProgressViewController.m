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
