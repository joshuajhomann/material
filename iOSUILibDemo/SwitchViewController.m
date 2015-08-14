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

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  [_mdSwitch addTarget:self
                action:@selector(updateState:)
      forControlEvents:UIControlEventValueChanged];
  [_customSwitch addTarget:self
                    action:@selector(updateState:)
          forControlEvents:UIControlEventValueChanged];
  _mdSwitch.tag = 0;
  _customSwitch.tag = 1;
  self.title = @"MDSwitch";

  // create a MDSwitch programmatically
  //  MDSwitch *newSwitch =
  //      [[MDSwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
  //  [self.view addSubview:newSwitch];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)updateState:(id)sender {
  MDSwitch *mdSwitch = (MDSwitch *)sender;
  if (mdSwitch.tag == 0) {
    _label.text =
        [NSString stringWithFormat:@"Switch: %@", mdSwitch.on ? @"ON" : @"OFF"];
  } else if (mdSwitch.tag == 1) {
    _customSwitchLabel.text = [NSString
        stringWithFormat:@"Custom Switch: %@", mdSwitch.on ? @"ON" : @"OFF"];
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
