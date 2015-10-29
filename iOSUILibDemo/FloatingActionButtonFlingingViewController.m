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

#import "FloatingActionButtonFlingingViewController.h"

@interface FloatingActionButtonFlingingViewController () <MDButtonDelegate>
@property(nonatomic) CGPoint startPoint;
@end

@implementation FloatingActionButtonFlingingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.btShare.mdButtonDelegate = self;
    
    //invisible all related buttons
    self.b1.alpha = 0.f;
    self.b2.alpha = 0.f;
    self.b3.alpha = 0.f;
    self.b4.alpha = 0.f;
    self.b5.alpha = 0.f;
    
    self.viewToolbar.alpha = 0.f;

}
-(void)viewDidLayoutSubviews{
    _startPoint = CGPointMake(self.btShare.center.x, self.btShare.center.y - 100);
    self.b1.center = _startPoint;
    self.b2.center = _startPoint;
    self.b3.center = _startPoint;
    self.b4.center = _startPoint;
    self.b5.center = _startPoint;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(id)sender {
    if (sender == self.btShare) {
        self.btShare.rotated = false;//reset floating finging button
    } else if (sender == self.btShareToolbar){
        //show toolbar view

        CGFloat duration = 0.2f;
        
        //Animation type1: scale animation
//        self.viewToolbar.hidden = NO;
//        self.btShareToolbar.hidden = YES;
//        [self.viewToolbar setClipsToBounds:NO];
//        self.viewToolbar.transform = CGAffineTransformMakeScale(0.1,0.1);
//        [self.viewToolbar.layer setCornerRadius:0.f];
//        
//        [self.viewToolbar.layer setMask:nil];
//        [UIView animateWithDuration:duration
//                              delay:0.0
//                            options: (UIViewAnimationOptionAllowUserInteraction|UIViewAnimationCurveEaseOut)
//                         animations:^{
//                             self.viewToolbar.alpha = 1;
//                             self.viewToolbar.transform = CGAffineTransformMakeScale(1.0,1.0);
//                         } completion:^(BOOL finished) {
//                             
//                         }];
        
        
        //Animation type2: expand circle
        CGPoint btShareToolbarCenter = self.btShareToolbar.center;
        
        [CATransaction begin];
        [self.viewToolbar.layer removeAllAnimations];
        [self.btShareToolbar.layer removeAllAnimations];
        
        CAKeyframeAnimation *moveBtnShareToolbarAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        moveBtnShareToolbarAnimation.calculationMode = kCAAnimationPaced;
        moveBtnShareToolbarAnimation.fillMode = kCAFillModeForwards;
        moveBtnShareToolbarAnimation.removedOnCompletion = NO;
        //Setting Endpoint of the animation
        CGPoint endPoint = self.viewToolbar.center;
        //to end animation in last tab use
        CGMutablePathRef curvedPath = CGPathCreateMutable();
        CGPathMoveToPoint(curvedPath, NULL, btShareToolbarCenter.x, btShareToolbarCenter.y);
        CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, btShareToolbarCenter.y, endPoint.x, btShareToolbarCenter.y, endPoint.x, endPoint.y);
        moveBtnShareToolbarAnimation.path = curvedPath;
        moveBtnShareToolbarAnimation.duration = duration;
        CGPathRelease(curvedPath);
        
        
        [CATransaction setCompletionBlock:^{
            [CATransaction begin];
            
            self.viewToolbar.alpha = 1;
            self.viewToolbar.hidden = NO;
            self.btShareToolbar.hidden = YES;
            
            CAShapeLayer *aCircle=[CAShapeLayer layer];
            CGFloat ratio = self.btShareToolbar.bounds.size.width/self.viewToolbar.bounds.size.width;
            int circleLayerWidth = self.viewToolbar.bounds.size.width;
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.viewToolbar.center.x - self.btShareToolbar.bounds.size.width/2, -(self.viewToolbar.bounds.size.width*ratio)/2 + self.viewToolbar.bounds.size.height/2, circleLayerWidth*ratio, circleLayerWidth*ratio)];
            aCircle.path = path.CGPath;
            aCircle.fillColor=[UIColor blackColor].CGColor;
            [self.viewToolbar.layer setMask:aCircle];
            
            CGRect _rect = CGRectMake(0, - self.viewToolbar.bounds.size.width/2 + self.viewToolbar.bounds.size.height/2, circleLayerWidth, circleLayerWidth);
            
            CABasicAnimation *circleLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
            circleLayerAnimation.toValue = (__bridge id)[UIBezierPath bezierPathWithOvalInRect:_rect].CGPath;
            circleLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            circleLayerAnimation.autoreverses = NO;
            circleLayerAnimation.repeatCount = 1;
            circleLayerAnimation.duration = duration;
            circleLayerAnimation.fillMode = kCAFillModeForwards;
            circleLayerAnimation.removedOnCompletion = NO;
            
            [CATransaction setCompletionBlock:^{
                [self.viewToolbar.layer setMask:nil];
            }];
            [aCircle addAnimation:circleLayerAnimation forKey:circleLayerAnimation.keyPath];
            [CATransaction commit];
        }];
        
        [self.btShareToolbar.layer addAnimation:moveBtnShareToolbarAnimation forKey:moveBtnShareToolbarAnimation.keyPath];
        
        [CATransaction commit];
    }
    
}
- (IBAction)tapGesture:(id)sender {
    //hide view toolbar
    CGFloat duration = 0.2f;
    CGPoint btShareToolbarCenter = self.btShareToolbar.center;
    
    CAShapeLayer *aCircle=[CAShapeLayer layer];
    int circleLayerWidth = self.viewToolbar.bounds.size.width;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, -self.viewToolbar.bounds.size.width/2 + self.viewToolbar.bounds.size.height/2, circleLayerWidth, circleLayerWidth)];
    aCircle.path = path.CGPath;
    aCircle.fillColor=[UIColor blackColor].CGColor;
    [self.viewToolbar.layer setMask:aCircle];
    
    [CATransaction begin];
    CGFloat ratio = self.btShareToolbar.bounds.size.width/self.viewToolbar.bounds.size.width;
    
    CGRect _rect = CGRectMake(self.viewToolbar.center.x - self.btShareToolbar.bounds.size.width/2, -(self.viewToolbar.bounds.size.width*ratio)/2 + self.viewToolbar.bounds.size.height/2, circleLayerWidth*ratio, circleLayerWidth*ratio);
    
    CABasicAnimation *circleLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleLayerAnimation.toValue = (__bridge id)[UIBezierPath bezierPathWithOvalInRect:_rect].CGPath;
    circleLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    circleLayerAnimation.autoreverses = NO;
    circleLayerAnimation.repeatCount = 1;
    circleLayerAnimation.duration = duration;
    
    [CATransaction setCompletionBlock:^{
        [self.btShareToolbar.layer removeAllAnimations];
        self.viewToolbar.hidden = YES;
        self.btShareToolbar.hidden = NO;

        CAKeyframeAnimation *moveBtnShareToolbarAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        moveBtnShareToolbarAnimation.calculationMode = kCAAnimationPaced;
        moveBtnShareToolbarAnimation.fillMode = kCAFillModeForwards;
        moveBtnShareToolbarAnimation.removedOnCompletion = NO;
        //Setting Endpoint of the animation
        CGPoint endPoint = btShareToolbarCenter;
        //to end animation in last tab use
        CGMutablePathRef curvedPath = CGPathCreateMutable();
        CGPathMoveToPoint(curvedPath, NULL, self.viewToolbar.center.x, self.viewToolbar.center.y);
        CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, self.viewToolbar.center.y, endPoint.x, self.viewToolbar.center.y, endPoint.x, endPoint.y);
        moveBtnShareToolbarAnimation.path = curvedPath;
        moveBtnShareToolbarAnimation.duration = duration/2;
        CGPathRelease(curvedPath);
        [self.btShareToolbar.layer addAnimation:moveBtnShareToolbarAnimation forKey:moveBtnShareToolbarAnimation.keyPath];
    }];
    
    [aCircle addAnimation:circleLayerAnimation forKey:circleLayerAnimation.keyPath];
    
    [CATransaction commit];
}

-(void)rotationStarted:(id)sender {
    if (self.btShare == sender){
        int padding = 70;
        CGFloat duration = 0.2f;
        if (!self.btShare.isRotated) {
            [UIView animateWithDuration:duration
                                  delay:0.0
                                options: (UIViewAnimationOptionAllowUserInteraction|UIViewAnimationCurveEaseOut)
                             animations:^{
                                 self.b1.alpha = 1;
                                 self.b1.transform = CGAffineTransformMakeScale(1.0,.4);
                                 self.b1.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0, -padding*4), CGAffineTransformMakeScale(1.0, 1.0));
                                 
                                 self.b2.alpha = 1;
                                 self.b2.transform = CGAffineTransformMakeScale(1.0,.5);
                                 self.b2.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0, -padding*3), CGAffineTransformMakeScale(1.0, 1.0));
                                 
                                 self.b3.alpha = 1;
                                 self.b3.transform = CGAffineTransformMakeScale(1.0,.6);
                                 self.b3.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0, -padding*2), CGAffineTransformMakeScale(1.0, 1.0));
                                 
                                 self.b4.alpha = 1;
                                 self.b4.transform = CGAffineTransformMakeScale(1.0,.7);
                                 self.b4.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0, -padding), CGAffineTransformMakeScale(1.0, 1.0));
                                 
                                 self.b5.alpha = 1;
                                 self.b5.transform = CGAffineTransformMakeScale(1.0,.8);
                                 self.b5.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0, 0), CGAffineTransformMakeScale(1.0, 1.0));
                                 
                             } completion:^(BOOL finished) {
                                 
                             }];
        } else {
            [UIView animateWithDuration:duration/2
                                  delay:0.0
                                options: kNilOptions
                             animations:^{
                                 self.b1.alpha = 0;
                                 self.b1.transform = CGAffineTransformMakeTranslation(0, 0);
                                 
                                 self.b2.alpha = 0;
                                 self.b2.transform = CGAffineTransformMakeTranslation(0, 0);
                                 
                                 self.b3.alpha = 0;
                                 self.b3.transform = CGAffineTransformMakeTranslation(0, 0);
                                 
                                 self.b4.alpha = 0;
                                 self.b4.transform = CGAffineTransformMakeTranslation(0, 0);
                                 
                                 self.b5.alpha = 0;
                                 self.b5.transform = CGAffineTransformMakeTranslation(0, 0);
                                 
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
    }
}
-(void)rotationCompleted:(id)sender{
    if (self.btShare == sender){
        NSLog(@"btShare rotationCompleted %s", self.btShare.isRotated?"rotated":"normal");
    }
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
