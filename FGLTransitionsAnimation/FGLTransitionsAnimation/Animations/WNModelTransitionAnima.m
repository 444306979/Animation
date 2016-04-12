//
//  WNModelTransitionAnima.m
//  FGLTransitionsAnimation
//
//  Created by 付国良 on 16/4/12.
//  Copyright © 2016年 玩哪儿. All rights reserved.
//

#import "WNModelTransitionAnima.h"

@interface WNModelTransitionAnima ()

@property (nonatomic, weak) UIViewController *modelController;

@end

@implementation WNModelTransitionAnima

- (instancetype)initWithModelController:(UIViewController *)modelController
{
    self = [super init];
    if (self) {
        _modelController = modelController;
        _type            = WNModelTransDirectionTypeBottom;
        _dragable        = NO;
        _bounces         = YES;
        _behindViewScale = 0.9f;
        _behindViewAlpha = 0.9f;
        _durationTime    = 1.0f;
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(orientationChanged:)
                                                     name: UIApplicationDidChangeStatusBarFrameNotification
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}
@end
