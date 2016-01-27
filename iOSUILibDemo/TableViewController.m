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

#import "TableViewController.h"
#import "MockData.h"
#import "iOSUILib/MDTableViewCell.h"
#import "UIFontHelper.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TableViewController {
  NSArray *data;
  UIFont *font;
}

NSString *RowIdentifier = @"RowIdentifier";

- (void)viewDidLoad {
  [super viewDidLoad];
  data = [MockData allCountriesArray];
  font = [UIFontHelper robotoFontOfSize:16];
  _tableView.dataSource = self;
  _tableView.delegate = self;
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

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"did select row: %li:%li", (long)indexPath.section, (long)indexPath.row);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
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
