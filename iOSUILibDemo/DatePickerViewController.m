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

#import "DatePickerViewController.h"
#import "iOSUILib/Calendar/NSDate+MDExtension.h"

#import "iOSUILib/Calendar/MDDatePicker.h"
@interface DatePickerViewController () <MDCalendarDelegate>
@property(nonatomic) MDCalendar *calendar;
@property(nonatomic) NSDateFormatter *dateFormatter;

@property(nonatomic) MDDatePicker *datePicker;
@end

@implementation DatePickerViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.

  _dateFormatter = [[NSDateFormatter alloc] init];

  MDDatePicker *datePicker =
      [[MDDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
  datePicker.delegate = self;
  [self.view addSubview:datePicker];
  _datePicker = datePicker;
  _datePicker.translatesAutoresizingMaskIntoConstraints = NO;

  [self.view
      addConstraint:[NSLayoutConstraint constraintWithItem:_datePicker
                                                 attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:self.view
                                                 attribute:NSLayoutAttributeTop
                                                multiplier:1
                                                  constant:0]];
  [self.view addConstraint:[NSLayoutConstraint
                               constraintWithItem:_datePicker
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeLeading
                                       multiplier:1
                                         constant:0]];
  [self.view addConstraint:[NSLayoutConstraint
                               constraintWithItem:_datePicker
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                       multiplier:1
                                         constant:0]];
  [self.view addConstraint:[NSLayoutConstraint
                               constraintWithItem:_datePicker
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1
                                         constant:0]];

  self.title = @"MDDatePicker";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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
- (void)calendar:(MDCalendar *)calendar didSelectDate:(NSDate *)date {
  _dateFormatter.dateFormat = @"dd-MM-yyyy";
  NSLog(@"DatePickerViewController didSelectDate %@",
        [_dateFormatter stringFromDate:date]);
}
@end
