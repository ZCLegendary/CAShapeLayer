//
//  PushAnimationType.m
//  CAShapeLayer Demo
//
//  Created by myMac on 16/9/13.
//  Copyright © 2016年 ChuangZhang. All rights reserved.
//

#import "PushAnimationType.h"

@implementation PushAnimationType


+ (CATransition *)getAnimationTypeWithNumber:(NSInteger)number {
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.subtype = kCATransitionFromRight;
    animation.type = kCATransitionReveal;

    switch (number) {
        case 1:
            animation.type = kCATransitionReveal;
            break;
        case 2:
            animation.type = kCATransitionMoveIn;
            break;
        case 3:
            animation.type = @"cube";
            break;
        case 4:
            animation.type = @"suckEffect";
            break;
        case 5:
            animation.type = @"rippleEffect";
            break;
        case 6:
            animation.type = @"pageCurl";
            break;
        case 7:
            animation.type = @"pageUnCurl";
            break;
        case 8:
            animation.type = kCATransitionFade;
            break;
        case 9:
            animation.type = kCATransitionMoveIn;
            animation.subtype = kCATransitionFromTop;
            break;
        default:
            break;
    }

    
    return animation;
    
}

@end
