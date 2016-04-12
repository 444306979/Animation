//
//  WNModelTransitionAnima.h
//  FGLTransitionsAnimation
//
//  Created by 付国良 on 16/4/12.
//  Copyright © 2016年 玩哪儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef NS_ENUM(NSUInteger, WNModelTransDirectionType) {
    WNModelTransDirectionTypeBottom, // Bottom
    WNModelTransDirectionTypeleft,   // Left
    WNModelTransDirectionTypeRight,  // Right
};

@interface WNModelTransitionAnima : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, assign) WNModelTransDirectionType type;
@property (nonatomic, assign, getter = isDragable) BOOL dragable;
@property (nonatomic, assign) BOOL bounces;
@property (nonatomic, assign) CGFloat behindViewScale;
@property (nonatomic, assign) CGFloat behindViewAlpha;
@property (nonatomic, assign) CGFloat durationTime;

@end
