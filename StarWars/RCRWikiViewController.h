//
//  RCRWikiViewController.h
//  StarWars
//
//  Created by Ramón Carnero Rojo on 13/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
#import "RCRStarWarsCharacter.h"

@interface RCRWikiViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) RCRStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel:(RCRStarWarsCharacter*) model;

@end
