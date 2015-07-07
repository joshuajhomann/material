//
//  ProgressViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 2/4/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDProgress.h"

@interface ProgressViewController : UIViewController
@property(weak, nonatomic) IBOutlet UIProgressView *progressView;
@property(weak, nonatomic) IBOutlet MDProgress *determinteProgress;
@property(weak, nonatomic) IBOutlet MDProgress *linearDeterminateProgress;
@property(weak, nonatomic) IBOutlet MDProgress *linearIndeterminateProgress;

@end
