//
//  FloatingButtonTranformingSheetViewController.m
//  iOSUILibDemo
//
//  Created by BachPX1 on 11/3/15.
//  Copyright © 2015 FPT Software. All rights reserved.
//

#import "FloatingButtonTranformingSheetViewController.h"
#import "MDDeviceHelper.h"
#import "UIView+MDExtension.h"

@interface FloatingButtonTranformingSheetViewController ()

@end

@implementation FloatingButtonTranformingSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    UIView *mainView = [MDDeviceHelper getMainView];
    self.btCompose.mdRight = mainView.mdWidth - 10;
    self.btCompose.mdTop = mainView.mdHeight - self.btCompose.mdHeight - (self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y) - 10;
    
    self.viewComposeOptions.mdBottom = self.btCompose.mdBottom;
    self.viewComposeOptions.mdRight = self.btCompose.mdRight;
}

- (IBAction)btnComposeClicked:(id)sender {
    self.viewComposeOptions.alpha = 1.f;
    self.viewComposeOptions.hidden = NO;
    self.btCompose.hidden = YES;
    
    //show sheet animation
    CGFloat duration = .2f;
    CAAnimationGroup *showSheetAnimationGroup = [CAAnimationGroup animation];
    showSheetAnimationGroup.duration = duration;
    showSheetAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    showSheetAnimationGroup.removedOnCompletion = false;
    showSheetAnimationGroup.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *moveUpAmimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveUpAmimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.viewComposeOptions.center.x, self.viewComposeOptions.center.y + 50)];
    moveUpAmimation.duration = duration/2;
    
    CGFloat circleLayerWidth = sqrt(pow(self.viewComposeOptions.bounds.size.height,2) + pow(self.viewComposeOptions.bounds.size.width, 2));
    
    CABasicAnimation *circleLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleLayerAnimation.toValue = (__bridge id)[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.viewComposeOptions.bounds.size.width/2, self.viewComposeOptions.bounds.size.height*3/4) radius:circleLayerWidth startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    //[UIBezierPath bezierPathWithOvalInRect:CGRectMake(-(circleLayerWidth - self.viewComposeOptions.bounds.size.width)/2, -(circleLayerWidth - self.viewComposeOptions.bounds.size.height)/2, circleLayerWidth, circleLayerWidth)].CGPath;
    circleLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circleLayerAnimation.autoreverses = NO;
    circleLayerAnimation.repeatCount = 1;
    circleLayerAnimation.duration = duration;
    circleLayerAnimation.fillMode = kCAFillModeForwards;
    circleLayerAnimation.removedOnCompletion = NO;
    
    CAShapeLayer *aCircle=[CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.viewComposeOptions.bounds.size.width/2, self.viewComposeOptions.bounds.size.height/2, self.btCompose.bounds.size.width, self.btCompose.bounds.size.width)];
    [path addArcWithCenter:CGPointMake(self.viewComposeOptions.bounds.size.width/2, self.viewComposeOptions.bounds.size.height*3/4) radius:self.viewComposeOptions.bounds.size.width/2 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    aCircle.path = path.CGPath;
    aCircle.fillColor=[UIColor blackColor].CGColor;
    [self.viewComposeOptions.layer setMask:aCircle];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        
    }];
    
    [self.viewComposeOptions.layer addAnimation:moveUpAmimation forKey:@"showSheet"];
    [aCircle addAnimation:circleLayerAnimation forKey:circleLayerAnimation.keyPath];
    //    showSheetAnimationGroup.animations =  [NSArray arrayWithObjects:moveUpAmimation, nil];
    
    
    [CATransaction commit];
}

- (IBAction)composeViewTap:(id)sender {
    //hide view
    CGFloat duration = .3f;
    self.viewComposeOptions.alpha = 1.f;
    CAAnimationGroup *moveComposeBtnAnimation = [CAAnimationGroup animation];
    moveComposeBtnAnimation.duration = duration;
    moveComposeBtnAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    moveComposeBtnAnimation.removedOnCompletion = false;
    moveComposeBtnAnimation.fillMode = kCAFillModeForwards;
    
    
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue = @(1.0f);
    opacityAnim.toValue = @(.3f);
    opacityAnim.duration = duration;
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    opacityAnim.removedOnCompletion = NO;
    opacityAnim.fillMode = kCAFillModeForwards;
    
    UIColor *fromColor = self.viewComposeOptions.backgroundColor;
    UIColor *toColor = self.btCompose.backgroundColor;
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnimation.duration = duration;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.calculationMode = kCAAnimationPaced;
    CGPoint endPoint = self.btCompose.frame.origin;
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, self.viewComposeOptions.center.x, self.viewComposeOptions.center.y);
    CGPathAddCurveToPoint(curvedPath, NULL, self.viewComposeOptions.center.x, self.viewComposeOptions.center.y, self.viewComposeOptions.center.x, endPoint.y, endPoint.x, endPoint.y);
    moveAnimation.path = curvedPath;
    moveAnimation.duration = duration;
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.timingFunctions = [NSArray arrayWithObjects:
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], nil];
    CGPathRelease(curvedPath);
    
    
    [CATransaction begin];
    CGFloat circleLayerWidth = sqrt(pow(self.viewComposeOptions.bounds.size.height,2) + pow(self.viewComposeOptions.bounds.size.width, 2));
    
    CABasicAnimation *circleLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleLayerAnimation.toValue = (__bridge id)[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.viewComposeOptions.bounds.size.width/2, self.viewComposeOptions.bounds.size.height/2, self.btCompose.bounds.size.width, self.btCompose.bounds.size.width)].CGPath;
    circleLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    circleLayerAnimation.autoreverses = NO;
    circleLayerAnimation.repeatCount = 1;
    circleLayerAnimation.duration = duration/2;
    circleLayerAnimation.fillMode = kCAFillModeForwards;
    circleLayerAnimation.removedOnCompletion = NO;
    
    CAShapeLayer *aCircle=[CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-(circleLayerWidth - self.viewComposeOptions.bounds.size.width)/2, -(circleLayerWidth - self.viewComposeOptions.bounds.size.height)/2, circleLayerWidth, circleLayerWidth)];
    aCircle.path = path.CGPath;
    aCircle.fillColor=[UIColor blackColor].CGColor;
    [self.viewComposeOptions.layer setMask:aCircle];
    
    [CATransaction setCompletionBlock:^{
        self.btCompose.hidden = NO;
        self.viewComposeOptions.alpha = 0.f;
        self.viewComposeOptions.hidden = YES;
        [self.viewComposeOptions.layer setMask:nil];
        [self.viewComposeOptions.layer removeAllAnimations];
    }];
    [self.viewComposeOptions.layer addAnimation:moveAnimation forKey:moveAnimation.keyPath];
    [self.viewComposeOptions.layer addAnimation:colorAnimation forKey:colorAnimation.keyPath];
    moveComposeBtnAnimation.animations =  [NSArray arrayWithObjects:circleLayerAnimation, nil];//opacityAnim,
    [aCircle addAnimation:moveComposeBtnAnimation forKey:circleLayerAnimation.keyPath];
    [CATransaction commit];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
