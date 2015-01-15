//
//  RCRCharacterViewController.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRCharacterViewController.h"
#import "RCRCafPlayer.h"
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
    [self syncWithModel];
}

#pragma mark - Actions

-(IBAction)playSound:(id)sender{
    
    self.player = [RCRCafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
    
}

-(IBAction)displayWikipedia:(id)sender{
    
    RCRWikiViewController *wVC = [[RCRWikiViewController alloc] initWithModel:self.model];
    [self.navigationController pushViewController:wVC animated:NO];
    
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden){
        
        //Hay que poner el botón en mi barra de navegación
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
        
    }else if (displayMode == UISplitViewControllerDisplayModeAllVisible){
        
        //Hay que quitar el botón de la barra de navegación
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RCRStarWarsUniverseViewControllerDelegate

-(void) starWarsUniverseViewController:(RCRStarWarsUniverseViewController *)uVC didSelectCharacter:(RCRStarWarsCharacter *)character{
    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    //me dicen que cambie mi modelo
    self.model = character;
    [self syncWithModel];
    
}

#pragma mark - Utils

-(void) syncWithModel{
    
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;
}


@end