//
//  AppDelegate.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AppDelegate.h"
#import "RCRStarWarsCharacter.h"
#import "RCRCharacterViewController.h"
#import "RCRWikiViewController.h"

/*@interface AppDelegate ()

@end*/

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //Creamos una window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor orangeColor]; //color de fondo
    
    // Creamos el modelo
    
    NSURL *vaderURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Darth_Vader"];
    
    NSBundle *bundle = [NSBundle mainBundle];//ruta al bundle de la aplicación
    NSURL *soundURL = [bundle URLForResource:@"vader" withExtension:@"caf"];
    NSData *vaderSound = [NSData dataWithContentsOfURL:soundURL];

    UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
    
    RCRStarWarsCharacter *vader = [RCRStarWarsCharacter starWarsCharacterWithName:@"Anakin Skywalker"
                                                                            alias:@"Darth Vader"
                                                                         wikiPage:vaderURL
                                                                            image:vaderImage
                                                                        soundData:vaderSound];
    
    // Creamos los controlador principal
    RCRCharacterViewController *charVC = [[RCRCharacterViewController alloc] initWithModel:vader];
    RCRWikiViewController *wVC = [[RCRWikiViewController alloc] initWithModel:vader];

    //Creamos el combinador
    UITabBarController  *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:@[charVC, wVC]];
    
    //Lo asignamos como root
    [self.window setRootViewController:tabVC];
    
    //Activamos la window
    [self.window makeKeyAndVisible]; //makeKey es que tenga el foco
    
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
