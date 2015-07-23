// The MIT License (MIT)
//
// Copyright (c) 2015 FPT Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TimePickerDialogViewController.h"

#import "iOSUILib/Calendar/NSDate+MDExtension.h"

#import "iOSUILib/Calendar/MDTimePickerDialog.h"
@interface TimePickerDialogViewController () <
    MDCalendarTimePickerDialogDelegate>
@property(weak, nonatomic) IBOutlet UITextField *txtTimerStart;
@property(weak, nonatomic) IBOutlet UIButton *btnStartTime;
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

- (void)timePickerDialog:(MDTimePickerDialog *)timePickerDialog
           didSelectHour:(NSInteger)hour
               andMinute:(NSInteger)minute {
  _timeTextField.text = [NSString stringWithFormat:@"%.2i:%.2i", hour, minute];
}
@end
