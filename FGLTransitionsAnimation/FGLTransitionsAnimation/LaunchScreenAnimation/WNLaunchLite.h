//
//  WNLaunchLite.h
//  FGLTransitionsAnimation
//
//  Created by 付国良 on 16/4/14.
//  Copyright © 2016年 玩哪儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WNLaunchLite : NSObject

/**
 *  启动页动画效果(简约：放大渐变)
 *
 *  @param window AppDelegate
 *  @param image  要执行动画的图片
 */
+ (void)animationWithWindow:(UIWindow *)window iamge:(UIImage *)image;

@end
