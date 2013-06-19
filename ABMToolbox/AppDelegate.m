//
//  AppDelegate.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "AppDelegate.h"
#import "ABMGlobalAppearance.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[ABMGlobalAppearance customizeAppearance];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	
}

@end
