//
//  RCRStarWarsUniverseViewController.h
//  StarWars
//
//  Created by Ramón Carnero Rojo on 14/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#define REBEL_SECTION 1
#define IMPERIAL_SECTION 0

#define CHARACTER_DID_CHANGE_NOTIFICATION_NAME @"CHARACTER"
#define CHARACTER_KEY @"CHARACTERKEY"

@import UIKit;
#import "RCRStarWarsUniverse.h"
@class RCRStarWarsUniverseViewController;

@protocol RCRStarWarsUniverseViewControllerDelegate <NSObject>

@optional
-(void)starWarsUniverseViewController:(RCRStarWarsUniverseViewController*)uVC
                   didSelectCharacter:(RCRStarWarsCharacter*) character;

-(void)starWarsUniverseViewController:(RCRStarWarsUniverseViewController*)uVC
                  willSelectCharacter:(RCRStarWarsCharacter*) character;

@end

@interface RCRStarWarsUniverseViewController : UITableViewController<RCRStarWarsUniverseViewControllerDelegate>

@property (weak,nonatomic) id <RCRStarWarsUniverseViewControllerDelegate> delegate;

-(id) initWithModel:(RCRStarWarsUniverse*)model style:(UITableViewStyle) style;

@end


