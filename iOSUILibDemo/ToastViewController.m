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

#import "ToastViewController.h"
#import "iOSUILib/MDToast.h"

@interface ToastViewController ()

@end

@implementation ToastViewController {
  int count;
  MDToast *toast;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.title = @"MDToast";
  toast = [[MDToast alloc] initWithText:@"" duration:kMDToastDurationShort];
  toast.backgroundColor = [UIColor colorWithRed:0 green:.2f blue:.5f alpha:.8f];
  toast.textFont = [UIFont systemFontOfSize:14];
  [toast setGravity:MDGravityCenterVertical | MDGravityCenterHorizontal];
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
  [toast
      setText:[NSString stringWithFormat:@"Toast test message %i.", count++]];
  [toast show];
}

- (IBAction)longToastTouchedUpInSide:(id)sender {
  MDToast *t = [[MDToast alloc]
      initWithText:[NSString stringWithFormat:@"Attention! This is a very, "
                                              @"very long test message. %i",
                                              count++]
          duration:kMDToastDurationShort];
  [t show];
}
@end
