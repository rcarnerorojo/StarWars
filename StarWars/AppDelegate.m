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
    // lo crearemos después al asignar los controladores (arrayOfControllers)
    
    // Creamos los controlador principal
    // los crearemos después al asignar los controladores (arrayOfControllers)
    
    //Creamos el combinador
    UITabBarController  *tabVC = [[UITabBarController alloc] init];
    //Le asignamos el array con los controladores
    [tabVC setViewControllers:[self arrayOfControllers]];
    
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


#pragma mark - Utils

-(NSArray*)arrayOfModels{
    
    //Crear los personajes
    
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

    NSURL *c3poURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/c-3po"];
    NSURL *c3poSoundURL = [bundle URLForResource:@"c3po" withExtension:@"caf"];
    NSData *c3poSound = [NSData dataWithContentsOfURL:c3poSoundURL];
    
    UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
    
    RCRStarWarsCharacter *c3po = [RCRStarWarsCharacter starWarsCharacterWithAlias:@"C-3PO"
                                                                         wikiPage:c3poURL
                                                                            image:c3poImage
                                                                        soundData:c3poSound];

    NSURL *r2d2URL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/R2-D2"];
    NSURL *r2d2SoundURL = [bundle URLForResource:@"r2-d2" withExtension:@"caf"];
    NSData *r2d2Sound = [NSData dataWithContentsOfURL:r2d2SoundURL];
    
    UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];

    RCRStarWarsCharacter *r2d2 = [RCRStarWarsCharacter starWarsCharacterWithAlias:@"R2-D2"
                                                                         wikiPage:r2d2URL
                                                                            image:r2d2Image
                                                                        soundData:r2d2Sound];
    
    NSURL *chewieURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/chewbacca"];
    NSURL *chewieSoundURL = [bundle URLForResource:@"chewbacca" withExtension:@"caf"];
    NSData *chewieSound = [NSData dataWithContentsOfURL:chewieSoundURL];
    
    UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
    
    RCRStarWarsCharacter *chewie = [RCRStarWarsCharacter starWarsCharacterWithAlias:@"Chewbacca"
                                                                           wikiPage:chewieURL
                                                                              image:chewieImage
                                                                          soundData:chewieSound];
    
    NSURL *yodaURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/yoda"];
    NSURL *yodaSoundURL = [bundle URLForResource:@"yoda" withExtension:@"caf"];
    NSData *yodaSound = [NSData dataWithContentsOfURL:yodaSoundURL];
    
    UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
    
    RCRStarWarsCharacter *yoda = [RCRStarWarsCharacter starWarsCharacterWithName:@"Minch Yoda"
                                                                           alias:@"Master Yoda"
                                                                        wikiPage:yodaURL
                                                                           image:yodaImage
                                                                       soundData:yodaSound];
    
    NSURL *palpatineURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Palpatine"];
    NSURL *palpatineSoundURL = [bundle URLForResource:@"palpatine" withExtension:@"caf"];
    NSData *palpatineSound = [NSData dataWithContentsOfURL:palpatineSoundURL];
    
    UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
    
    RCRStarWarsCharacter *palpatine = [RCRStarWarsCharacter starWarsCharacterWithAlias:@"Darth Sidious"
                                                                              wikiPage:palpatineURL
                                                                                 image:palpatineImage
                                                                             soundData:palpatineSound];
   
    NSURL *tarkinURL = [NSURL URLWithString:@"http://es.wikipedia.org/wiki/Wilhuff_Tarkin"];
    NSURL *tarkinSoundURL = [bundle URLForResource:@"tarkin" withExtension:@"caf"];
    NSData *tarkinSound = [NSData dataWithContentsOfURL:tarkinSoundURL];
    
    UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];
    
    RCRStarWarsCharacter *tarkin = [RCRStarWarsCharacter starWarsCharacterWithName:@"Wilhuff Tarkin"
                                                                             alias:@"Grand Modd Tarkin"
                                                                           wikiPage:tarkinURL
                                                                              image:tarkinImage
                                                                          soundData:tarkinSound];
    return @[vader, c3po, r2d2, chewie, yoda, palpatine, tarkin];
}

-(NSArray*)arrayOfControllers{
    
    NSArray *models = [self arrayOfModels];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:[models count]];
    
    //Recorremos el array de modelos y por cada uno creamos un controlador y lo metemos en un navigation
    // y a ese lo añadimos al controlador
    
    for (RCRStarWarsCharacter *character in models) {
        
        RCRCharacterViewController *charVC = [[RCRCharacterViewController alloc] initWithModel:character];
        
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:charVC];
        
        [controllers addObject:navVC];
    }
    
    return controllers;
}


@end
