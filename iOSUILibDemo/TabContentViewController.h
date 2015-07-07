//
//  TabContentViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 5/18/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabContentViewController : UIViewController
@property(weak, nonatomic) IBOutlet UILabel *Label;

- (void)setContent:(NSString *)content;
@end
