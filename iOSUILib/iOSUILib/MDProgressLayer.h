//
//  MDProgressLayer.h
//  iOSUILib
//
//  Created by VuH on 2/9/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface MDProgressLayer : CALayer

@property(nonatomic) UIColor *progressColor;
@property(nonatomic) UIColor *trackColor;
@property(nonatomic) float trackWidth;
@property(nonatomic) BOOL drawTrack;
@property(nonatomic) BOOL determinate;
@property(nonatomic) float progress;
@property(nonatomic) CALayer *superLayer;

@property(nonatomic) BOOL isAnimating;

- (instancetype)initWithSuperLayer:(CALayer *)superLayer;
- (void)superLayerDidResize;
- (void)startAnimating;
- (void)stopAnimating;
- (void)initContents;

@end
