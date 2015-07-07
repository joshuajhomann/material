//
//  TabBarViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 4/14/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDTabBar.h"

@interface TabBarViewController : UIViewController
@property(weak, nonatomic) IBOutlet MDTabBar *tabBar;
@property(weak, nonatomic) IBOutlet UITextField *label;
@property(weak, nonatomic) IBOutlet UITextField *index;
@property(weak, nonatomic) IBOutlet UISwitch *animated;
- (IBAction)add:(id)sender;
- (IBAction)replace:(id)sender;
- (IBAction)remove:(id)sender;
- (IBAction)select:(id)sender;
@property(weak, nonatomic) IBOutlet UILabel *selectedLabel;

@end
