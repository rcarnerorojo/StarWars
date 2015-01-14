//
//  RCRCharacterViewController.h
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
#import "RCRStarWarsCharacter.h"
#import "RCRCafPlayer.h"

@interface RCRCharacterViewController : UIViewController

@property (strong,nonatomic) RCRStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong,nonatomic) RCRCafPlayer *player;

-(id) initWithModel:(RCRStarWarsCharacter*)model;

-(IBAction)playSound:(id)sender;
-(IBAction)displayWikipedia:(id)sender;

@end
