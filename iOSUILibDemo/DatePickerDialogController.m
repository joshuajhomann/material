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

#import "DatePickerDialogController.h"
#import "iOSUILib/Calendar/NSDate+MDExtension.h"
#import "iOSUILib/Calendar/MDDatePickerDialog.h"
@interface DatePickerDialogController () <MDDatePickerDialogDelegate>
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
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = 1980;
    dateComponents.month = 1;
    dateComponents.day = 5;
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
      
    MDDatePickerDialog *datePicker = [[MDDatePickerDialog alloc] init];
    _datePicker = datePicker;
    _datePicker.minimumDate = date;
    _datePicker.selectedDate = date;
    _datePicker.delegate = self;
  }
  [_datePicker show];
}
/* ;
 #pragma mark - Navigation
*/

- (void)datePickerDialogDidSelectDate:(NSDate *)date {
  _dateFormatter.dateFormat = @"dd-MM-yyyy";
  _txtDate.text = [_dateFormatter stringFromDate:date];
}

@end
