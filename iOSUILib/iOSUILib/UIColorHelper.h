//
//  UIColorHelper.h
//  iOSUILib
//
//  Created by Public on 5/15/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColorHelper : NSObject
+ (UIColor *)colorWithRGBA:(NSString *)rgba;

+ (UIColor *)colorFromRGB:(NSString *)rgb withAlpha:(float)alpha;
@end
