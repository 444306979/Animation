//
//  WNLaunchScreenBoard.m
//  FGLTransitionsAnimation
//
//  Created by 付国良 on 16/4/14.
//  Copyright © 2016年 玩哪儿. All rights reserved.
//

#import "WNLaunchScreenBoard.h"
#import "CALayer+Cool.h"
@interface WNLaunchScreenBoard ()

@property (nonatomic, readonly) NSString *launchScreenName;
@property (nonatomic, weak    ) UILabel  *label;

@end

@implementation WNLaunchScreenBoard

#pragma mark - <<<<<< Life Cycel >>>>>> -
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     获取启动页图片
     */
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.launchScreenName]];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:imageView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 100);
    label.textAlignment = NSTextAlignmentCenter;
    label.center = self.view.center;
    label.text = @"WANNAR";
    [self.view addSubview:label];
    
    self.label = label;
    self.label.hidden = NO;
    self.label.alpha = 0.0;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3.0 animations:^{
            self.label.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view.layer transitionWithAnimType:TransitionAnimTypeSuckEffect subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.6];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:NO completion:nil];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - <<<<<< Lazy >>>>>> -
- (NSString *)launchScreenName
{
    NSArray *array = [[NSBundle mainBundle] infoDictionary][@"UILaunchImages"];
    NSString *lauScrName;
    for (NSDictionary *dic in array) {
        NSString *sizeStr = dic[@"UILaunchImageSize"];
        CGSize size = CGSizeFromString(sizeStr);
        if (size.width == [UIScreen mainScreen].bounds.size.width && size.height == [UIScreen mainScreen].bounds.size.height) {
            lauScrName = dic[@"UILaunchImageName"];
            continue;
        }
    }
    return lauScrName;
}



@end
