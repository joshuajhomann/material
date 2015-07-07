//
//  TableViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 3/19/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "TableViewController.h"
#import "FakeData.h"
#import "iOSUILib/MDTableViewCell.h"
#import "iOSUILib/UIFontHelper.h"

@interface TableViewController () <UITableViewDataSource>

@end

@implementation TableViewController {
  NSArray *data;
  UIFont *font;
}

NSString *RowIdentifier = @"RowIdentifier";

- (void)viewDidLoad {
  [super viewDidLoad];
  data = [FakeData allCountriesArray];
  font = [UIFontHelper robotoFontOfSize:16];
  _TableView.dataSource = self;
  self.title = @"MDTableViewCell";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MDTableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:RowIdentifier];
  if (cell == nil) {
    // Create new MDTableViewCell with default style, or you can subclass it.
    cell = [[MDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:RowIdentifier];
  }

  cell.textLabel.font = font;
  cell.textLabel.adjustsFontSizeToFitWidth = NO;
  cell.textLabel.text = [data objectAtIndex:indexPath.row];

  return cell;
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
