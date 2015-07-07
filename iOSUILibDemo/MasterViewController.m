//
//  MasterViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 1/29/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "MasterViewController.h"
#import "ButtonViewController.h"
#import "ProgressViewController.h"
#import "TextFieldViewController.h"
#import "TableViewController.h"
#import "SwitchViewController.h"
#import "DatePickerViewController.h"
#import "DatePickerDialogController.h"
#import "CollectionViewController.h"
#import "TabBarViewController.h"
#import "TimePickerDialogViewController.h"
#import "TabBarViewControllerViewController.h"
#import "SnackBarViewController.h"
#import "ToastViewController.h"
#import "SliderViewController.h"

@interface MasterViewController ()

@property NSMutableArray *controls;

@end

@implementation MasterViewController

static NSArray *controlsName;

+ (NSArray *)controlsName {
  if (!controlsName)
    controlsName = [NSArray
        arrayWithObjects:@"Button", @"TableView Cell", @"Progress Bar",
                         @"Text Field", @"Switch", @"Date Picker",
                         @"Date Picker Dialog", @"Collection View Cell",
                         @"Tab Bar", @"Time Picker Dialog",
                         @"Tab Bar View Controller", @"Snackbar", @"Toast",
                         @"Slider", nil];

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

- (BOOL)tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  // Return NO if you do not want the specified item to be editable.
  return YES;
}

- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self.controls removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[ indexPath ]
                     withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array,
    // and add a new row to the table view.
  }
}

@end
