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

#import "NormalTextFieldViewController.h"
#import "MockData.h"

@interface NormalTextFieldViewController () <MDTextFieldDelegate>

@end

@implementation NormalTextFieldViewController {
  MDTextField *activeField;
  NSArray *inputAccessoryViews;
  CGFloat inputAccessoryViewHeight;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  for (MDTextField *textField in _textFields) {
    textField.delegate = self;
  }

  [[_textFields objectAtIndex:3]
      setSuggestionsDictionary:[MockData allCountriesArray]];

  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(dismissKeyboard)];

  [self.view addGestureRecognizer:tap];

  [self.view addConstraint:[NSLayoutConstraint
                               constraintWithItem:_containerView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                       multiplier:1
                                         constant:0]];

  [self createInputAccessoryView];
  for (UITextField *field in _textFields) {
    [field setInputAccessoryView:[inputAccessoryViews objectAtIndex:field.tag]];
  }
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self unregisterForKeyboardNotifications];
}
- (void)dismissKeyboard {
  [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications {
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(keyboardWasShown:)
             name:UIKeyboardDidShowNotification
           object:nil];
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(keyboardWillBeHidden:)
             name:UIKeyboardWillHideNotification
           object:nil];
}

- (void)unregisterForKeyboardNotifications {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification *)aNotification {
  NSDictionary *info = [aNotification userInfo];
  CGSize kbSize =
      [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
  CGFloat kbHeight = kbSize.height + inputAccessoryViewHeight;
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbHeight, 0.0);
  _scrollView.contentInset = contentInsets;
  _scrollView.scrollIndicatorInsets = contentInsets;

  // If active text field is hidden by keyboard, scroll it so it's visible
  // Your application might not need or want this behavior.
  CGRect aRect = self.view.frame;
  aRect.size.height -= kbHeight;
  CGPoint p = CGPointMake(0, activeField.frame.origin.y +
                                 activeField.frame.size.height);
  if (!CGRectContainsPoint(aRect, p)) {
    CGPoint scrollPoint = CGPointMake(0.0, p.y - aRect.size.height);
    [_scrollView setContentOffset:scrollPoint animated:YES];
  }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
  UIEdgeInsets contentInsets = UIEdgeInsetsZero;
  _scrollView.contentInset = contentInsets;
  _scrollView.scrollIndicatorInsets = contentInsets;
}

- (BOOL)textFieldShouldBeginEditing:(MDTextField *)textField {
  return YES;
}

- (void)textFieldDidBeginEditing:(MDTextField *)textField {
  activeField = textField;
}

- (void)textFieldDidEndEditing:(MDTextField *)textField {
  activeField = nil;
}

- (void)textFieldDidChange:(MDTextField *)textField {
  // if textfield is characterCounterTextField
  if (textField.tag == 1) {
    if (textField.text.length > textField.maxCharacterCount) {
      textField.errorMessage = @"Message is too long";
      textField.hasError = YES;
    } else {
      textField.hasError = NO;
    }
  }
}

- (void)createInputAccessoryView {
  inputAccessoryViews = [[NSArray alloc]
      initWithObjects:[[UIToolbar alloc] init], [[UIToolbar alloc] init],
                      [[UIToolbar alloc] init], [[UIToolbar alloc] init], nil];

  for (UIToolbar *inputAccView in inputAccessoryViews) {
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:101
                             target:nil
                             action:@selector(gotoPrevTextfield)];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:102
                             target:nil
                             action:@selector(gotoNextTextfield)];
    UIBarButtonItem *doneButton =
        [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                         style:UIBarButtonItemStylePlain
                                        target:nil
                                        action:@selector(dismissKeyboard)];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                             target:nil
                             action:nil];
    UIBarButtonItem *placeholder =
        [[UIBarButtonItem alloc] initWithTitle:@""
                                         style:UIBarButtonItemStylePlain
                                        target:nil
                                        action:nil];

    [inputAccView sizeToFit];
    inputAccessoryViewHeight = inputAccView.frame.size.height;
    [inputAccView
        setItems:[NSArray arrayWithObjects:prevButton, placeholder, nextButton,
                                           placeholder, flexSpace, placeholder,
                                           doneButton, nil]
        animated:YES];

    // disable the previous button in the first accessory view
    ((UIBarButtonItem *)[((UIToolbar *)[inputAccessoryViews objectAtIndex:0])
                             .items objectAtIndex:0])
        .enabled = NO;
    // disable the next button in the last accessory view
    ((UIBarButtonItem *)[((UIToolbar *)[inputAccessoryViews objectAtIndex:3])
                             .items objectAtIndex:2])
        .enabled = NO;
  }
}

- (void)gotoPrevTextfield {
  [[_textFields objectAtIndex:(activeField.tag - 1)] becomeFirstResponder];
}

- (void)gotoNextTextfield {
  [[_textFields objectAtIndex:(activeField.tag + 1)] becomeFirstResponder];
}

- (void)doneTyping {
  [activeField resignFirstResponder];
}

@end
