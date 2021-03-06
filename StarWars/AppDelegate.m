//
//  AppDelegate.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AppDelegate.h"
#import "RCRStarWarsUniverse.h"
#import "RCRStarWarsUniverseViewController.h"
#import "RCRCharacterViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //Creamos una window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Compruebo el tipo de pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        //tableta
        [self configureForPad];
    }else{
        [self configureForPhone];
    }
    
    //Activamos la window
    [self.window makeKeyAndVisible];
    
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


#pragma mark - Configuration

-(void)configureForPad{
    
    // Creamos el modelo
    RCRStarWarsUniverse *model = [[RCRStarWarsUniverse alloc]init];
    
    // Creamos los controladores
    RCRStarWarsUniverseViewController *uVC = [[RCRStarWarsUniverseViewController alloc]initWithModel:model style:UITableViewStylePlain];
    RCRCharacterViewController *charVC = [[RCRCharacterViewController alloc] initWithModel:[model imperialCharacterAtIndex:0]];
    
    //Creamos los combinadores
    UINavigationController *tableNav = [[UINavigationController alloc]init];
    [tableNav pushViewController:uVC animated:NO];
    
    UINavigationController *charNav = [[UINavigationController alloc]init];
    [charNav pushViewController:charVC animated:NO];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    [splitVC setViewControllers:@[tableNav,charNav]];
    
    //Asignamos delegados
    splitVC.delegate = charVC;
    uVC.delegate = charVC;
    
    //Lo asignamos como root
    [self.window setRootViewController:splitVC];
    
}

-(void)configureForPhone{

    // Creamos el modelo
    RCRStarWarsUniverse *model = [[RCRStarWarsUniverse alloc]init];
    
    // Creamos el controlador
    RCRStarWarsUniverseViewController *uVC = [[RCRStarWarsUniverseViewController alloc]initWithModel:model style:UITableViewStylePlain];
    
    //Creamos el combinador
    UINavigationController *navVC = [[UINavigationController alloc]init];
    [navVC pushViewController:uVC animated:NO];
    
    //Asignamos delegados
    uVC.delegate = uVC;
    
    //Lo asignamos como root
    [self.window setRootViewController:navVC];
    
}

@end
