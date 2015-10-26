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

#import "MDButton.h"
#import "MDRippleLayer.h"
#import "MDConstants.h"
#import "UIColorHelper.h"

@interface MDButton ()

@property MDRippleLayer *mdLayer;

@end

@implementation MDButton
@dynamic enabled;

- (instancetype)init {
  if (self = [super init])
    [self initLayer];
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder])
    [self initLayer];
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame])
    [self initLayer];
  return self;
}

- (id)initWithFrame:(CGRect)frame
               type:(enum MDButtonType)buttonType
        rippleColor:(UIColor *)rippleColor {
  if (self = [super initWithFrame:frame]) {
    [self initLayer];
    self.mdButtonType = buttonType;
    if (rippleColor)
      self.rippleColor = rippleColor;
  }
  return self;
}

- (void)initLayer {
  _rippleColor = [UIColor colorWithWhite:0.5 alpha:1];
  if (self.backgroundColor == nil) {
    self.backgroundColor =
        [UIColorHelper colorWithRGBA:kMDButtonBackgroundColor];
  }
  self.layer.cornerRadius = 2.5;
  _mdLayer = [[MDRippleLayer alloc] initWithSuperView:self];
  _mdLayer.effectColor = _rippleColor;
  _mdLayer.rippleScaleRatio = 1;
}

- (void)layoutSubviews {
  [super layoutSubviews];
}

#pragma mark setters
- (void)setFrame:(CGRect)frame {
  [super setFrame:frame];
}

- (void)setRippleColor:(UIColor *)rippleColor {
  _rippleColor = rippleColor;
  _mdLayer.effectColor = _rippleColor;
}

- (void)setType:(NSInteger)type {
    switch (type) {
        case 1:
            [self setMdButtonType:MDButtonTypeFlat];
            break;
        case 2:
            [self setMdButtonType:MDButtonTypeFloatingAction];
            break;
        case 3:
            [self setMdButtonType:MDButtonTypeFloatingActionRotation];
            break;
        default:
            [self setMdButtonType:MDButtonTypeRaised];
    }
}

- (void)setMdButtonType:(enum MDButtonType)mdButtonType {
  _mdButtonType = mdButtonType;
  [self setupButtonType];
}

- (void)setEnabled:(BOOL)enabled {
  [super setEnabled:enabled];
  [self setupButtonType];
}

#pragma mark private methods
- (void)setupButtonType {
    if (self.enabled) {
        switch (_mdButtonType) {
            case MDButtonTypeRaised:
                _mdLayer.enableElevation = true;
                _mdLayer.restingElevation = 2;
                break;
            case MDButtonTypeFlat:
                _mdLayer.enableElevation = false;
                self.backgroundColor = [UIColor clearColor];
                break;
            case MDButtonTypeFloatingAction: {
                float size = MIN(self.bounds.size.width, self.bounds.size.height);
                self.layer.cornerRadius = size / 2;
                
                _mdLayer.restingElevation = 6;
                _mdLayer.enableElevation = true;
            }
                break;
                
            case MDButtonTypeFloatingActionRotation: {
                float size = MIN(self.bounds.size.width, self.bounds.size.height);
                self.layer.cornerRadius = size / 2;
                
                _mdLayer.restingElevation = 0;
                _mdLayer.enableElevation = false;
            }
                break;
        }
    } else {
        _mdLayer.enableElevation = false;
    }
}

-(void)setImageNormal:(UIImage *)imageNormal {
    [self setImage:imageNormal forState:UIControlStateNormal];
    if (imageNormal != nil) {
        self.imageView.clipsToBounds = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    _imageNormal = imageNormal;
}

#pragma Touch Delegate
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    if (!_enabledRotation) {
        return;
    }
    
    if (_mdButtonType != MDButtonTypeFloatingActionRotation) {
        return;
    } else {
        
    }
    _mdLayer.enableElevation = false;
    
    CGFloat duration = 0.3f;
    if (_imageNormal == nil || _imageRotated == nil) {
        if (!_rotated) {
            [UIView animateWithDuration:duration
                                  delay:0.0
                                options: kNilOptions
                             animations:^{
                                 self.transform = CGAffineTransformMakeRotation(M_PI/4);
                             } completion:^(BOOL finished) {
                                _rotated = true;
                                 if (_mdButtonDelegate) {
                                     [_mdButtonDelegate rotationCompleted:self];
                                 }
                             }];
            if (_mdButtonDelegate) {
                [_mdButtonDelegate rotationStarted:self];
            }
        } else {
            [UIView animateWithDuration:duration
                                  delay:0.0
                                options: kNilOptions
                             animations:^{
                                 self.transform = CGAffineTransformMakeRotation(0);
                             } completion:^(BOOL finished) {
                                 _rotated = false;
                                 if (_mdButtonDelegate) {
                                     [_mdButtonDelegate rotationCompleted:self];
                                 }
                             }];
            if (_mdButtonDelegate) {
                [_mdButtonDelegate rotationStarted:self];
            }
        }
    } else {
        if (!_rotated) {
            [UIView animateWithDuration:duration/2
                                  delay:0.0
                                options: kNilOptions
                             animations:^{
                                 self.imageView.alpha = 0.0;
                                 self.transform = CGAffineTransformMakeRotation(M_PI/4);
                             } completion:^(BOOL finished) {
                                 [self setImage:_imageRotated forState:UIControlStateNormal];
                                 self.transform = CGAffineTransformMakeRotation(-M_PI/2);
                                 [UIView animateWithDuration:duration/2 animations:^{
                                     self.imageView.alpha = 1;
                                     self.transform = CGAffineTransformMakeRotation(0);
                                 }completion:^(BOOL finished) {
                                     _rotated = true;
                                     if (_mdButtonDelegate) {
                                         [_mdButtonDelegate rotationCompleted:self];
                                     }
                                 }];
                             }];
            if (_mdButtonDelegate) {
                [_mdButtonDelegate rotationStarted:self];
            }
        } else {
            [UIView animateWithDuration:duration/2
                                  delay:0.0
                                options: kNilOptions
                             animations:^{
                                 self.imageView.alpha = 0.0;
                                 self.transform = CGAffineTransformMakeRotation(-M_PI/4);
                             } completion:^(BOOL finished) {
                                 [self setImage:_imageNormal forState:UIControlStateNormal];
                                 self.transform = CGAffineTransformMakeRotation(M_PI/2);
                                 [UIView animateWithDuration:duration/2 animations:^{
                                     self.imageView.alpha = 1;
                                     self.transform = CGAffineTransformMakeRotation(0);
                                 }completion:^(BOOL finished) {
                                     _rotated = false;
                                     if (_mdButtonDelegate) {
                                         [_mdButtonDelegate rotationCompleted:self];
                                     }
                                 }];
                             }];
            if (_mdButtonDelegate) {
                [_mdButtonDelegate rotationStarted:self];
            }
        }
    }
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}
@end
