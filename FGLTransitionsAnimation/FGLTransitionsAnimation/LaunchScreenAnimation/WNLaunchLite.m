//
//  WNLaunchLite.m
//  FGLTransitionsAnimation
//
//  Created by 付国良 on 16/4/14.
//  Copyright © 2016年 玩哪儿. All rights reserved.
//

#import "WNLaunchLite.h"

#define iphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)
#define iphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)
#define iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)
#define iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

@implementation WNLaunchLite

+ (void)animationWithWindow:(UIWindow *)window iamge:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = image == nil ? [self getLaunchImage] : image;
    [window.rootViewController.view addSubview:imageView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            imageView.transform = CGAffineTransformMakeScale(2.2f, 2.2f);
            imageView.layer.opacity = 0.0f;
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
    });
}

+ (UIImage *)getLaunchImage
{
    NSString *imageName = @"LaunchImage-700";
    
    if(iphone5x_4_0) imageName = @"LaunchImage-700-568h";
    
    if(iphone6_4_7) imageName = @"LaunchImage-800-667h";
    
    if(iphone6Plus_5_5) imageName = @"LaunchImage-800-Portrait-736h";
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    NSAssert(image != nil, @"WNAassert（提示您：请添加启动图片！）");
    
    return image;
}

@end
