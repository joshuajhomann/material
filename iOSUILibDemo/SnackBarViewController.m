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

#import "iOSUILib/MDSnackbar.h"
#import "SnackBarViewController.h"
#import "UIColorHelper.h"

@interface SnackBarViewController ()

@end

@implementation SnackBarViewController {
  //  MDSnackbar *snackbar;
  int count;
}

- (void)viewDidLoad {
  [super viewDidLoad];
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
