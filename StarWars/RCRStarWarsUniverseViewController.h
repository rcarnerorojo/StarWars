//
//  RCRStarWarsUniverseViewController.h
//  StarWars
//
//  Created by Ramón Carnero Rojo on 14/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#define REBEL_SECTION 1
#define IMPERIAL_SECTION 0

@import UIKit;
#import "RCRStarWarsUniverse.h"

@interface RCRStarWarsUniverseViewController : UITableViewController

-(id) initWithModel:(RCRStarWarsUniverse*)model style:(UITableViewStyle) style;

@end
