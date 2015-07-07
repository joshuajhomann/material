//
//  SliderViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 6/8/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDSlider.h"

@interface SliderViewController : UIViewController
@property(weak, nonatomic) IBOutlet MDSlider *mdSlider;
@property(weak, nonatomic) IBOutlet MDSlider *discreteSilder;
- (IBAction)discreteSliderValueChanged:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
@property(weak, nonatomic) IBOutlet UILabel *continuousSliderValue;
@property(weak, nonatomic) IBOutlet UILabel *discreteSliderValue;

@end
