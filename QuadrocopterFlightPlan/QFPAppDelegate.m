//
//  AppDelegate.m
//  ARDrone
//
//  Created by Chris Eidhof on 29.12.13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "QFPAppDelegate.h"
#import "DroneCommunicator.h"
#import "ViewController.h"
#import "ClientViewController.h"
@import MultipeerConnectivity;



@interface QFPAppDelegate ()

@property (nonatomic, strong) DroneCommunicator *communicator;
@property (nonatomic, strong) ViewController *vc;
@end

@implementation QFPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Remote
//    self.vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
//    self.window.rootViewController = self.vc;
    
    //Local
    ClientViewController *cvc = [[ClientViewController alloc] init];
    self.window.rootViewController = cvc;
    
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application;
{
    [self.communicator land];
}

@end