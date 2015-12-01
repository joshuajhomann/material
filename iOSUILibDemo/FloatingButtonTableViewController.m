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

#import "FloatingButtonTableViewController.h"
#import "FloatingActionButtonFlingingViewController.h"
#import "FloatingButtonToolbarViewController.h"
#import "FloatingButtonTranformingSheetViewController.h"
#import "MDTableViewCell.h"

@interface FloatingButtonTableViewController ()
@property NSMutableArray *buttonTypes;
@end

@implementation FloatingButtonTableViewController

static NSArray *floatingButtonTypeName;

+ (NSArray *)floatingButtonTypeName {
  if (!floatingButtonTypeName)
    floatingButtonTypeName =
        [NSArray arrayWithObjects:@"Transform into a toolbar",
                                  @"Flinging out related actions",
                                  @"Transforming into a single sheet", nil];

  return floatingButtonTypeName;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.tableView.rowHeight = 44;
  self.tableView.dataSource = self;
  self.tableView.delegate = self;

  for (NSString *control in
       [FloatingButtonTableViewController floatingButtonTypeName]) {
    [self insertRow:control];
  }
  [self.navigationController.navigationBar setTranslucent:NO];
  self.title = @"Floating Button";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)insertRow:(NSString *)label {
  if (!self.buttonTypes) {
    self.buttonTypes = [[NSMutableArray alloc] init];
  }
  [self.buttonTypes addObject:label];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.buttonTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (cell == nil) {
    // Create new MDTableViewCell with default style, or you can subclass it.
    cell = [[MDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:@"cell"];
  }

  cell.textLabel.adjustsFontSizeToFitWidth = NO;
  cell.textLabel.text = [self.buttonTypes objectAtIndex:indexPath.row];

  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"did select row: %li:%li", (long)indexPath.section,
        (long)indexPath.row);
  UIViewController *controller = nil;

  if (indexPath.row == 0) {
    controller = [[FloatingButtonToolbarViewController alloc] init];
  } else if (indexPath.row == 1) {
    controller = [[FloatingActionButtonFlingingViewController alloc] init];
  } else if (indexPath.row == 2) {
    controller = [[FloatingButtonTranformingSheetViewController alloc] init];
  }

  if (controller)
    [self.navigationController pushViewController:controller animated:YES];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath
 *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath]
 withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array,
 and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath
 *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath
 *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Table view delegate

 // In a xib-based application, navigation from a table can be handled in
 -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath
 *)indexPath {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#>
 alloc] initWithNibName:<#@"Nib name"#> bundle:nil];

 // Pass the selected object to the new view controller.

 // Push the view controller.
 [self.navigationController pushViewController:detailViewController
 animated:YES];
 }
 */

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
