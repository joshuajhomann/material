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

#import "SliderViewController.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // create a MDSlider programmatically
  //  MDSlider *slider = [[MDSlider alloc] init];
  //  slider.minimumValue = 5;
  //  slider.maximumValue = 50;
  //  slider.step = 5;
  //  slider.enabledValueLabel = YES;
  //  [self.view addSubview:slider];
  //  slider.translatesAutoresizingMaskIntoConstraints = NO;
  //  [self.view addConstraint:[NSLayoutConstraint
  //                               constraintWithItem:slider
  //                                        attribute:NSLayoutAttributeLeading
  //                                        relatedBy:NSLayoutRelationEqual
  //                                           toItem:self.view
  //                                        attribute:NSLayoutAttributeLeading
  //                                       multiplier:1
  //                                         constant:0]];
  //  [self.view addConstraint:[NSLayoutConstraint
  //                               constraintWithItem:slider
  //                                        attribute:NSLayoutAttributeTrailing
  //                                        relatedBy:NSLayoutRelationEqual
  //                                           toItem:self.view
  //                                        attribute:NSLayoutAttributeTrailing
  //                                       multiplier:1
  //                                         constant:0]];
  //  [self.view
  //      addConstraint:[NSLayoutConstraint constraintWithItem:slider
  //                                                 attribute:NSLayoutAttributeTop
  //                                                 relatedBy:NSLayoutRelationEqual
  //                                                    toItem:self.view
  //                                                 attribute:NSLayoutAttributeTop
  //                                                multiplier:1
  //                                                  constant:0]];
  _discreteSliderValue.text =
      [NSString stringWithFormat:@"%.f", _discreteSilder.value];
  _continuousSliderValue.text =
      [NSString stringWithFormat:@"%.01f", _mdSlider.value];
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

- (IBAction)discreteSliderValueChanged:(id)sender {
  _discreteSliderValue.text =
      [NSString stringWithFormat:@"%.f", _discreteSilder.value];
}

- (IBAction)sliderValueChanged:(id)sender {
  _continuousSliderValue.text =
      [NSString stringWithFormat:@"%.01f", _mdSlider.value];
}

- (IBAction)switchChanged:(id)sender {
  _mdSlider.enabled = ((UISwitch *)sender).on;
  _discreteSilder.enabled = ((UISwitch *)sender).on;
}
@end
