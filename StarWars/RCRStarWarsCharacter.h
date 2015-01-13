//
//  RCRStarWarsCharacter.h
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface RCRStarWarsCharacter : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSURL *wikiPage;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSData *soundData;

#pragma mark - Class Methods

+(instancetype) starWarsCharacterWithName:(NSString*)name
                                    alias:(NSString*)alias
                                 wikiPage:(NSURL*)url
                                    image:(UIImage*)photo
                                soundData:(NSData*)soundData;

+(instancetype) starWarsCharacterWithAlias:(NSString*)alias
                                  wikiPage:(NSURL*)url
                                     image:(UIImage*)photo
                                 soundData:(NSData*)soundData;

#pragma mark - Init
//designated
-(id) initWithName:(NSString*)name
             alias:(NSString*)alias
          wikiPage:(NSURL*)url
             image:(UIImage*)photo
         soundData:(NSData*)soundData;

-(id) initWithAlias:(NSString*)alias
          wikiPage:(NSURL*)url
             image:(UIImage*)photo
         soundData:(NSData*)soundData;

@end
