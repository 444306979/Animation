//
//  ViewController.m
//  FGLTransitionsAnimation
//
//  Created by 付国良 on 16/4/12.
//  Copyright © 2016年 玩哪儿. All rights reserved.
//

#import "ViewController.h"
#import "WNLaunchScreenBoard.h"
#import "CALayer+Cool.h"

@interface ViewController ()
@property (nonatomic, strong  ) UIView   *snapshotView;
@property (nonatomic, readonly) NSString *launchScreenName;
@property (nonatomic, readonly) BOOL     isStatusBarInitiallyHidden;
@property (nonatomic, weak    ) UILabel  *label;
@end

@implementation ViewController

#pragma mark - <<<<<< Life Cycle >>>>>> -
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 保证一下代码只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 获取启动图
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.launchScreenName]];
        imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self.view addSubview:imageView];
        
        // 要做动画的控件
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(self.view.center.x, 0);
        label.text = @"玩哪儿";
        label.font = [UIFont systemFontOfSize:46];
        label.textColor = [UIColor whiteColor];
        [self.view addSubview:label];
        self.label = label;
        self.label.hidden = NO;
        self.label.alpha = 0.0;

        // 动画效果
        [UIView animateWithDuration:0.5 animations:^{
            self.label.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.5 animations:^{
                self.label.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
//                self.label.transform = CGAffineTransformMakeRotation(M_PI);
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [imageView removeFromSuperview];
                    [self.label removeFromSuperview];
                    [self.view.layer transitionWithAnimType:TransitionAnimTypeRippleEffect subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.6];
                });
            }];
        }];
//        self.view.backgroundColor = [UIColor redColor];
//        WNLaunchScreenBoard *LSB = [[WNLaunchScreenBoard alloc] init];
//        [self presentViewController:LSB animated:NO completion:nil];
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


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
