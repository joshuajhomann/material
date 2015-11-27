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
#import "MDDeviceHelper.h"
#import "UIView+MDExtension.h"

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
    
    _startPoint = CGPointMake(0, 0);
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenWidth = screenRect.size.width;
            CGFloat screenHeight = screenRect.size.height;
            self.btShare.center = CGPointMake(screenWidth,screenHeight) ;
    
            _startPoint = CGPointMake(self.btShare.center.x, self.btShare.center.y - 100);
            self.b1.center = _startPoint;
            self.b2.center = _startPoint;
            self.b3.center = _startPoint;
            self.b4.center = _startPoint;
            self.b5.center = _startPoint;
}
-(void)viewWillLayoutSubviews{

}

-(void)viewDidLayoutSubviews{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    self.btShare.center = CGPointMake(screenWidth - self.btShare.mdWidth/2 - 10,screenHeight - self.btShare.mdHeight/2 - 10 - (self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y)) ;

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
    }
    
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
        //NSLog(@"btShare rotationCompleted %s", self.btShare.isRotated?"rotated":"normal");
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
