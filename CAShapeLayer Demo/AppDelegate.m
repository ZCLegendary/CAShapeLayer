//
//  AppDelegate.m
//  CAShapeLayer Demo
//
//  Created by 张闯 on 16/9/12.
//  Copyright © 2016年 ChuangZhang. All rights reserved.
//

#import "AppDelegate.h"
<<<<<<< HEAD
#import "ViewController.h"
=======
>>>>>>> 90fa62db47951261d55daf7a84d8b3890570978e

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
<<<<<<< HEAD
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *rootVC = [[ViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    [navi.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    navi.navigationBar.shadowImage = [UIImage new];
    UIColor *textColor = [UIColor whiteColor];
    navi.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont fontWithName:@"AppleGothic" size:17]};
    
    self.window.rootViewController = navi;
    
    
=======
>>>>>>> 90fa62db47951261d55daf7a84d8b3890570978e
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
