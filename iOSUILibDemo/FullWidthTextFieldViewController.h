//
//  FullWidthTextFieldViewController.h
//  iOSUILibDemo
//
//  Created by Public on 3/25/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDTextField.h"

@interface FullWidthTextFieldViewController : UIViewController
@property(weak, nonatomic) IBOutlet MDTextField *fromTextField;
@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet UIView *containerView;

@end
