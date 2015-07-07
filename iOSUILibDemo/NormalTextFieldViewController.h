//
//  TextFieldViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 3/2/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDTextField.h"

@interface NormalTextFieldViewController : UIViewController
@property(weak, nonatomic) IBOutlet MDTextField *autoCompleteTextField;
@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet UIView *containerView;
@property(weak, nonatomic) IBOutlet MDTextField *normalTextField;
@property(weak, nonatomic) IBOutlet MDTextField *characterCounterTextField;
@property(weak, nonatomic) IBOutlet MDTextField *labeledTextField;

@end
