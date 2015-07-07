//
//  ButtonViewController.h
//  iOSUILibDemo
//
//  Created by VuH on 1/29/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSUILib/MDButton.h"

@interface ButtonViewController : UIViewController
@property (weak, nonatomic) IBOutlet MDButton *RaisedButton;
@property (weak, nonatomic) IBOutlet MDButton *FlatButton;
@property (weak, nonatomic) IBOutlet MDButton *FloatingActionButton;
- (IBAction)touchUpInside:(id)sender;


@end
