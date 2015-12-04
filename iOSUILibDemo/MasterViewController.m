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

#import "ButtonViewController.h"
#import "CollectionViewController.h"
#import "DatePickerDialogController.h"
#import "DatePickerViewController.h"
#import "FloatingButtonTableViewController.h"
#import "MasterViewController.h"
#import "ProgressViewController.h"
#import "SliderViewController.h"
#import "SnackBarViewController.h"
#import "SwitchViewController.h"
#import "TabBarViewController.h"
#import "TabBarViewControllerViewController.h"
#import "TableViewController.h"
#import "TextFieldViewController.h"
#import "TimePickerDialogViewController.h"
#import "ToastViewController.h"
#import "iOSUILib/Calendar/NSCalendarHelper.h"

@interface MasterViewController ()

@property NSMutableArray *controls;

@end

@implementation MasterViewController

static NSArray *controlsName;

+ (NSArray *)controlsName {
  if (!controlsName)
    controlsName = [NSArray
        arrayWithObjects:@"Button", @"ButtonFloating", @"TableView Cell",
                         @"Progress Bar", @"Text Field", @"Switch",
                         @"Date Picker", @"Date Picker Dialog",
                         @"Collection View Cell", @"Tab Bar",
                         @"Time Picker Dialog", @"Tab Bar View Controller",
                         @"Snackbar", @"Toast", @"Slider", nil];

  return controlsName;
}

- (void)awakeFromNib {
  [super awakeFromNib];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.rowHeight = 44;
  for (NSString *control in [MasterViewController controlsName]) {
    [self insertRow:control];
  }
  [self.navigationController.navigationBar setTranslucent:NO];
  [[NSCalendarHelper mdSharedCalendar] setFirstWeekday:2];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)insertRow:(NSString *)label {
  if (!self.controls) {
    self.controls = [[NSMutableArray alloc] init];
  }
  [self.controls addObject:label];
  //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  //    [self.tableView insertRowsAtIndexPaths:@[indexPath]
  //    withRowAnimation:UITableViewRowAnimationAutomatic];
  //    self.tableView ins
}

#pragma mark - Segues

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *controls = self.controls[indexPath.row];
//        [[segue destinationViewController] setDetailItem:controls];
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIViewController *controller = nil;
  NSString *row = self.controls[indexPath.row];
  if ([row isEqualToString:@"Button"]) {
    controller = [[ButtonViewController alloc] init];
  } else if ([row isEqualToString:@"ButtonFloating"]) {
    controller = [[FloatingButtonTableViewController alloc] init];
  } else if ([row isEqualToString:@"TableView Cell"]) {
    controller = [[TableViewController alloc] init];
  } else if ([row isEqualToString:@"Progress Bar"]) {
    controller = [[ProgressViewController alloc] init];
  } else if ([row isEqualToString:@"Text Field"]) {
    controller = [[TextFieldViewController alloc] init];
  } else if ([row isEqualToString:@"Switch"]) {
    controller = [[SwitchViewController alloc] init];
  } else if ([row isEqualToString:@"Date Picker"]) {
    controller = [[DatePickerViewController alloc] init];
  } else if ([row isEqualToString:@"Date Picker Dialog"]) {
    controller = [[DatePickerDialogController alloc] init];
  } else if ([row isEqualToString:@"Collection View Cell"]) {
    controller = [[CollectionViewController alloc] init];
  } else if ([row isEqualToString:@"Tab Bar"]) {
    controller = [[TabBarViewController alloc] init];
  } else if ([row isEqualToString:@"Time Picker Dialog"]) {
    controller = [[TimePickerDialogViewController alloc] init];
  } else if ([row isEqualToString:@"Tab Bar View Controller"]) {
    controller = [[TabBarViewControllerViewController alloc] init];
  } else if ([row isEqualToString:@"Snackbar"]) {
    controller = [[SnackBarViewController alloc] init];
  } else if ([row isEqualToString:@"Toast"]) {
    controller = [[ToastViewController alloc] init];
  } else if ([row isEqualToString:@"Slider"]) {
    controller = [[SliderViewController alloc] init];
  }

  if (controller)
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.controls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                      forIndexPath:indexPath];

  NSDate *object = self.controls[indexPath.row];
  cell.textLabel.text = [object description];
  return cell;
}

@end
