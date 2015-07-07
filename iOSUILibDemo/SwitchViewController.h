//
//  SwitchViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 30/03/2015.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDSwitch.h"

@interface SwitchViewController : UIViewController
@property(weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet MDSwitch *mdSwitch;
@property (weak, nonatomic) IBOutlet MDSwitch *customSwitch;
@property (weak, nonatomic) IBOutlet UILabel *customSwitchLabel;

@end
