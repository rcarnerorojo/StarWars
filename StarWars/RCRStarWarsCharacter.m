//
//  RCRStarWarsCharacter.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 12/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRStarWarsCharacter.h"

@implementation RCRStarWarsCharacter

+(instancetype) starWarsCharacterWithName:(NSString*)name
                                    alias:(NSString*)alias
                                 wikiPage:(NSURL*)url
                                    image:(UIImage*)photo
                                soundData:(NSData*)soundData{
    
    return [[self alloc]initWithName:name
                               alias:alias wikiPage:url
                               image:photo
                           soundData:soundData];
}

+(instancetype) starWarsCharacterWithAlias:(NSString*)alias
                                  wikiPage:(NSURL*)url
                                     image:(UIImage*)photo
                                 soundData:(NSData*)soundData{
    
    return [[self alloc]initWithAlias:alias
                             wikiPage:url
                                image:photo
                            soundData:soundData];
}

-(id) initWithName:(NSString*)name
             alias:(NSString*)alias
          wikiPage:(NSURL*)url
             image:(UIImage*)photo
         soundData:(NSData*)soundData{
    
    if (self = [super init]){
        _name = name;
        _alias = alias;
        _wikiPage = url;
        _photo = photo;
        _soundData = soundData;
    }
    
    return self;
}

-(id) initWithAlias:(NSString*)alias
           wikiPage:(NSURL*)url
              image:(UIImage*)photo
          soundData:(NSData*)soundData{
    
    return  [self initWithName:nil
                         alias:alias
                      wikiPage:url
                         image:photo
                     soundData:soundData];
}

@end
