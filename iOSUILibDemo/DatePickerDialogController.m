//
//  DatePickerDialogController.m
//  iOSUILibDemo
//
//  Created by BachPX1 on 4/2/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "DatePickerDialogController.h"
#import "iOSUILib/Calendar/NSDate+MDExtension.h"
#import "iOSUILib/Calendar/MDDatePickerDialog.h"
@interface DatePickerDialogController () <MDCalendarDatePickerDialogDelegate>
@property(weak, nonatomic) IBOutlet UITextField *txtDate;
@property(nonatomic) NSDateFormatter *dateFormatter;

@property(nonatomic) MDDatePickerDialog *datePicker;
@end

@implementation DatePickerDialogController

- (void)viewDidLoad {
  [super viewDidLoad];

  _dateFormatter = [[NSDateFormatter alloc] init];

  self.title = @"MDDatePickerDialog";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelectDate:(id)sender {
  if (!_datePicker) {
    MDDatePickerDialog *datePicker = [[MDDatePickerDialog alloc] init];
    _datePicker = datePicker;
    _datePicker.delegate = self;
  }
  [_datePicker show];
}
/*
 #pragma mark - Navigation
*/

- (void)datePickerDialogDidSelectDate:(NSDate *)date {
  _dateFormatter.dateFormat = @"dd-MM-yyyy";
  _txtDate.text = [_dateFormatter stringFromDate:date];
}

@end
