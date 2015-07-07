//
//  SliderViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 6/8/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  //  _mdSlider.enabled = NO;
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
