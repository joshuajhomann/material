//
//  TabContentViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 5/18/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "TabContentViewController.h"

@interface TabContentViewController ()

@end

@implementation TabContentViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (void)setContent:(NSString *)content {
  [self.Label setText:content];
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
