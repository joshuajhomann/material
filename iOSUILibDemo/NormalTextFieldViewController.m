//
//  TextFieldViewController.m
//  iOSUILibDemo
//
//  Created by VuH on 3/2/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "NormalTextFieldViewController.h"
#import "FakeData.h"

@interface NormalTextFieldViewController () <MDTextFieldDelegate>

@end

@implementation NormalTextFieldViewController {
  MDTextField *activeField;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  _autoCompleteTextField.delegate = self;
  _normalTextField.delegate = self;
  _labeledTextField.delegate = self;
  _characterCounterTextField.delegate = self;

  [_autoCompleteTextField
      setSuggestionsDictionary:[FakeData allCountriesArray]];

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
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
  _scrollView.contentInset = contentInsets;
  _scrollView.scrollIndicatorInsets = contentInsets;

  // If active text field is hidden by keyboard, scroll it so it's visible
  // Your application might not need or want this behavior.
  CGRect aRect = self.view.frame;
  aRect.size.height -= kbSize.height;
  CGPoint p = CGPointMake(0, activeField.frame.origin.y +
                                 activeField.frame.size.height);
  if (!CGRectContainsPoint(aRect, p)) {
    CGPoint scrollPoint = CGPointMake(0.0, p.y - kbSize.height);
    [_scrollView setContentOffset:scrollPoint animated:YES];
  }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
  UIEdgeInsets contentInsets = UIEdgeInsetsZero;
  _scrollView.contentInset = contentInsets;
  _scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(MDTextField *)textField {
  activeField = textField;
}

- (void)textFieldDidEndEditing:(MDTextField *)textField {
  activeField = nil;
}

- (void)textFieldDidChange:(MDTextField *)textField {
  if (textField == _characterCounterTextField) {
    if (textField.text.length > textField.maxCharacterCount) {
      textField.errorMessage = @"Message is too long";
      textField.hasError = YES;
    } else {
      textField.hasError = NO;
    }
  }
}

@end
