//
//  UIFontHelper.h
//  iOSUILib
//
//  Created by VuH on 5/20/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIFontHelper : NSObject
typedef NS_OPTIONS(NSInteger, MDFontFamilySize) {
  MDFontFamilySizeRegular = 0,
  MDFontFamilySizeBold = 1,
  MDFontFamilySizeLight = 2,
  MDFontFamilySizeMedium = 3,
  MDFontFamilySizeThin = 4,
  MDFontFamilySizeBlack = 5,
};

typedef NS_OPTIONS(NSInteger, MDFontFamilyType) {
  MDFontFamilyBold = 1,
  MDFontFamilyItalic = 2
};
//+ (UIFont *)robotoFontOfSize:(CGFloat)fontSize
//                withFontName:(NSString *)fontName;
+ (UIFont *)robotoFontWithName:(NSString *)fontName size:(CGFloat)fontSize;
+ (UIFont *)robotoFontOfSize:(CGFloat)fontSize;
+ (NSString *)robotoFontName:(MDFontFamilySize)fontFamily
                    withType:(MDFontFamilyType)fontType;
@end
