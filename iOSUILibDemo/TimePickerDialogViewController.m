//
//  TimePickerDialogViewController.m
//  iOSUILibDemo
//
//  Created by BachPX1 on 4/7/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "TimePickerDialogViewController.h"

#import "iOSUILib/Calendar/NSDate+MDExtension.h"

#import "iOSUILib/Calendar/MDTimePickerDialog.h"
@interface TimePickerDialogViewController () <
    MDCalendarTimePickerDialogDelegate>
@property(weak, nonatomic) IBOutlet UITextField *txtTimerStart;
@property(weak, nonatomic) IBOutlet UITextField *txtTimerFinish;
@property(weak, nonatomic) IBOutlet UIButton *btnStartTime;
@property(weak, nonatomic) IBOutlet UIButton *btnFinishTime;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *btnStart;
@property(nonatomic) NSDateFormatter *dateFormatter;

@property(nonatomic) MDTimePickerDialog *timerPicker;
@end

@implementation TimePickerDialogViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.title = @"MDTimePickerDialog";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelectTime:(id)sender {
  if (!_timerPicker) {
    MDTimePickerDialog *datePicker = [[MDTimePickerDialog alloc] init];
    _timerPicker = datePicker;
    _timerPicker.delegate = self;
  }
  [_timerPicker show];
}

- (void)timePickerDialogDidSelectTime:(NSInteger)hour
                             andMinute:(NSInteger)minute {
  _timeTextField.text = [NSString stringWithFormat:@"%.2i:%.2i", hour, minute];
}
@end
