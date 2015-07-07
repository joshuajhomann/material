//
//  SwitchViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 30/03/2015.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

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
