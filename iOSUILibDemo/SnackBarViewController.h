//
//  SnackBarViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 5/28/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnackBarViewController : UIViewController
@property(weak, nonatomic) IBOutlet UIButton *btnShow;
- (IBAction)onTouchUpInside:(id)sender;

@end
