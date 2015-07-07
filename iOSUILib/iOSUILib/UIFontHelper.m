//
//  UIFontHelper.m
//  iOSUILib
//
//  Created by VuH on 5/20/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "UIFontHelper.h"

@implementation UIFontHelper
+ (UIFont *)robotoFontOfSize:(CGFloat)fontSize
                withFontName:(NSString *)fontName {
  UIFont *font;
  if (fontName == nil) {
    font = [UIFont fontWithName:@"roboto-regular" size:fontSize];
  } else {
    font = [UIFont fontWithName:fontName size:fontSize];
  }
  return [font copy];
}

+ (UIFont *)robotoFontWithName:(NSString *)fontName size:(CGFloat)fontSize {
  UIFont *font;
  if (fontName == nil) {
    font = [UIFont fontWithName:@"roboto-regular" size:fontSize];
  } else {
    font = [UIFont fontWithName:fontName size:fontSize];
  }
  return [font copy];
}

+ (UIFont *)robotoFontOfSize:(CGFloat)fontSize {

  return [UIFontHelper robotoFontOfSize:fontSize withFontName:nil];
}

+ (NSString *)robotoFontName:(MDFontFamilySize)fontFamily
                    withType:(MDFontFamilyType)fontType {
  NSString *fontName;
  switch (fontFamily) {
  case MDFontFamilySizeBlack:
    fontName = @"Roboto-Black";
    break;
  }

  return fontName;
}

@end
