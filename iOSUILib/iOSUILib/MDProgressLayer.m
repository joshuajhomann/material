//
//  MDProgressLayer.m
//  iOSUILib
//
//  Created by VuH on 2/9/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//

#import "MDProgressLayer.h"

#define kMDTrackWidth 5.f

@implementation MDProgressLayer

- (instancetype)initWithSuperLayer:(CALayer *)superLayer {
  if (self = [super init]) {
    _superLayer = superLayer;
    _trackWidth = kMDTrackWidth;
    [self initContents];
    [_superLayer addSublayer:self];
    [_superLayer addObserver:self forKeyPath:@"bounds" options:9 context:nil];
  }
  return self;
}

- (void)setProgress:(float)progress {
  if (!_determinate)
    return;

  if (progress > 1)
    _progress = 1;
  else if (progress < 0)
    _progress = 0;
  else
    _progress = progress;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
  [self superLayerDidResize];
}

@end
