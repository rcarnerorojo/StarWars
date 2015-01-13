//
//  RCRCharacterViewController.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRCharacterViewController.h"
#import "CafPlayer.h"
#import "RCRWikiViewController.h"

@implementation RCRCharacterViewController

-(id) initWithModel:(RCRStarWarsCharacter*)model{
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        _model = model;
        self.title = model.alias;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //sincronizo modelo -> vista
    self.photoView.image = self.model.photo;
    
}

#pragma mark - Actions

-(IBAction)playSound:(id)sender{
    
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
    
}

-(IBAction)displayWikipedia:(id)sender{
    
    RCRWikiViewController *wVC = [[RCRWikiViewController alloc] initWithModel:self.model];
    [self.navigationController pushViewController:wVC animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end