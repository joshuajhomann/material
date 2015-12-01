//
//  FloatingButtonToolbarViewController.m
//  iOSUILibDemo
//
//  Created by BachPX1 on 11/2/15.
//  Copyright © 2015 FPT Software. All rights reserved.
//

#import "FloatingButtonToolbarViewController.h"
#import "MDDeviceHelper.h"
#import "UIView+MDExtension.h"

@interface FloatingButtonToolbarViewController ()

@end

@implementation FloatingButtonToolbarViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {

  [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
  UIView *mainView = [MDDeviceHelper getMainView];
  self.viewToolbar.mdWidth = mainView.mdWidth;
  self.viewToolbar.mdTop =
      mainView.mdHeight - self.viewToolbar.mdHeight -
      (self.navigationController.navigationBar.frame.size.height +
       self.navigationController.navigationBar.frame.origin.y);

  self.btShareToolbar.mdTop =
      self.viewToolbar.mdTop - self.btShareToolbar.mdHeight / 2;
  self.btShareToolbar.mdLeft =
      mainView.mdWidth - self.btShareToolbar.mdWidth - 10;
}

- (IBAction)btShareClicked:(id)sender {
  // show toolbar view

  CGFloat duration = 0.2f;

  // Animation type1: scale animation
  //        self.viewToolbar.hidden = NO;
  //        self.btShareToolbar.hidden = YES;
  //        [self.viewToolbar setClipsToBounds:NO];
  //        self.viewToolbar.transform = CGAffineTransformMakeScale(0.1,0.1);
  //        [self.viewToolbar.layer setCornerRadius:0.f];
  //
  //        [self.viewToolbar.layer setMask:nil];
  //        [UIView animateWithDuration:duration
  //                              delay:0.0
  //                            options:
  //                            (UIViewAnimationOptionAllowUserInteraction|UIViewAnimationCurveEaseOut)
  //                         animations:^{
  //                             self.viewToolbar.alpha = 1;
  //                             self.viewToolbar.transform =
  //                             CGAffineTransformMakeScale(1.0,1.0);
  //                         } completion:^(BOOL finished) {
  //
  //                         }];

  // Animation type2: expand circle
  CGPoint btShareToolbarCenter = self.btShareToolbar.center;

  [CATransaction begin];
  [self.viewToolbar.layer removeAllAnimations];
  [self.btShareToolbar.layer removeAllAnimations];

  CAKeyframeAnimation *moveBtnShareToolbarAnimation =
      [CAKeyframeAnimation animationWithKeyPath:@"position"];
  moveBtnShareToolbarAnimation.calculationMode = kCAAnimationPaced;
  moveBtnShareToolbarAnimation.fillMode = kCAFillModeForwards;
  moveBtnShareToolbarAnimation.removedOnCompletion = NO;
  CGPoint endPoint = self.viewToolbar.center;
  CGMutablePathRef curvedPath = CGPathCreateMutable();
  CGPathMoveToPoint(curvedPath, NULL, btShareToolbarCenter.x,
                    btShareToolbarCenter.y);
  CGPathAddCurveToPoint(curvedPath, NULL, btShareToolbarCenter.x, endPoint.y,
                        btShareToolbarCenter.x, endPoint.y, endPoint.x,
                        endPoint.y);
  moveBtnShareToolbarAnimation.path = curvedPath;
  moveBtnShareToolbarAnimation.duration = duration;
  CGPathRelease(curvedPath);

  [CATransaction setCompletionBlock:^{
    [CATransaction begin];

    self.viewToolbar.alpha = 1;
    self.viewToolbar.hidden = NO;
    self.btShareToolbar.hidden = YES;

    CAShapeLayer *aCircle = [CAShapeLayer layer];
    CGFloat ratio = self.btShareToolbar.bounds.size.width /
                    self.viewToolbar.bounds.size.width;
    int circleLayerWidth = self.viewToolbar.bounds.size.width;
    UIBezierPath *path = [UIBezierPath
        bezierPathWithOvalInRect:
            CGRectMake(self.viewToolbar.center.x -
                           self.btShareToolbar.bounds.size.width / 2,
                       -(self.viewToolbar.bounds.size.width * ratio) / 2 +
                           self.viewToolbar.bounds.size.height / 2,
                       circleLayerWidth * ratio, circleLayerWidth * ratio)];
    aCircle.path = path.CGPath;
    aCircle.fillColor = [UIColor blackColor].CGColor;
    [self.viewToolbar.layer setMask:aCircle];

    CGRect _rect = CGRectMake(0, -self.viewToolbar.bounds.size.width / 2 +
                                     self.viewToolbar.bounds.size.height / 2,
                              circleLayerWidth, circleLayerWidth);

    CABasicAnimation *circleLayerAnimation =
        [CABasicAnimation animationWithKeyPath:@"path"];
    circleLayerAnimation.toValue =
        (__bridge id)[UIBezierPath bezierPathWithOvalInRect:_rect].CGPath;
    circleLayerAnimation.timingFunction = [CAMediaTimingFunction
        functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    circleLayerAnimation.autoreverses = NO;
    circleLayerAnimation.repeatCount = 1;
    circleLayerAnimation.duration = duration;
    circleLayerAnimation.fillMode = kCAFillModeForwards;
    circleLayerAnimation.removedOnCompletion = NO;

    [CATransaction setCompletionBlock:^{
      [self.viewToolbar.layer setMask:nil];
    }];
    [aCircle addAnimation:circleLayerAnimation
                   forKey:circleLayerAnimation.keyPath];
    [CATransaction commit];
  }];

  [self.btShareToolbar.layer addAnimation:moveBtnShareToolbarAnimation
                                   forKey:moveBtnShareToolbarAnimation.keyPath];

  [CATransaction commit];
}

- (IBAction)mainViewTap:(id)sender {
  if (self.viewToolbar.hidden)
    return;
  // hide view toolbar
  CGFloat duration = 0.2f;
  CGPoint btShareToolbarCenter = self.btShareToolbar.center;

  CAShapeLayer *aCircle = [CAShapeLayer layer];
  int circleLayerWidth = self.viewToolbar.bounds.size.width;
  UIBezierPath *path = [UIBezierPath
      bezierPathWithOvalInRect:CGRectMake(
                                   0,
                                   -self.viewToolbar.bounds.size.width / 2 +
                                       self.viewToolbar.bounds.size.height / 2,
                                   circleLayerWidth, circleLayerWidth)];
  aCircle.path = path.CGPath;
  aCircle.fillColor = [UIColor blackColor].CGColor;
  [self.viewToolbar.layer setMask:aCircle];

  [CATransaction begin];
  CGFloat ratio = self.btShareToolbar.bounds.size.width /
                  self.viewToolbar.bounds.size.width;

  CGRect _rect = CGRectMake(self.viewToolbar.center.x -
                                self.btShareToolbar.bounds.size.width / 2,
                            -(self.viewToolbar.bounds.size.width * ratio) / 2 +
                                self.viewToolbar.bounds.size.height / 2,
                            circleLayerWidth * ratio, circleLayerWidth * ratio);

  CABasicAnimation *circleLayerAnimation =
      [CABasicAnimation animationWithKeyPath:@"path"];
  circleLayerAnimation.toValue =
      (__bridge id)[UIBezierPath bezierPathWithOvalInRect:_rect].CGPath;
  circleLayerAnimation.timingFunction = [CAMediaTimingFunction
      functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  circleLayerAnimation.autoreverses = NO;
  circleLayerAnimation.repeatCount = 1;
  circleLayerAnimation.duration = duration;
  circleLayerAnimation.removedOnCompletion = false;
  circleLayerAnimation.fillMode = kCAFillModeForwards;

  [CATransaction setCompletionBlock:^{
    [self.btShareToolbar.layer removeAllAnimations];
    self.viewToolbar.hidden = YES;
    self.btShareToolbar.hidden = NO;
    [self.viewToolbar.layer removeAllAnimations];

    CAKeyframeAnimation *moveBtnShareToolbarAnimation =
        [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveBtnShareToolbarAnimation.calculationMode = kCAAnimationPaced;
    moveBtnShareToolbarAnimation.fillMode = kCAFillModeForwards;
    moveBtnShareToolbarAnimation.removedOnCompletion = NO;
    // Setting Endpoint of the animation
    CGPoint endPoint = btShareToolbarCenter;
    // to end animation in last tab use
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, self.viewToolbar.center.x,
                      self.viewToolbar.center.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x,
                          self.viewToolbar.center.y, endPoint.x,
                          self.viewToolbar.center.y, endPoint.x, endPoint.y);
    moveBtnShareToolbarAnimation.path = curvedPath;
    moveBtnShareToolbarAnimation.duration = duration / 2;
    CGPathRelease(curvedPath);
    [self.btShareToolbar.layer
        addAnimation:moveBtnShareToolbarAnimation
              forKey:moveBtnShareToolbarAnimation.keyPath];
  }];

  [aCircle addAnimation:circleLayerAnimation
                 forKey:circleLayerAnimation.keyPath];

  [CATransaction commit];
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
