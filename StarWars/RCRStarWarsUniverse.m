//
//  RCRStarWarsUniverse.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 14/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRStarWarsUniverse.h"

@interface RCRStarWarsUniverse ()

@property (nonatomic, strong) NSArray *imperials;
@property (nonatomic, strong) NSArray *rebels;

@end

@implementation RCRStarWarsUniverse

#pragma mark - properties

-(NSUInteger) rebelCount{
    return [self.rebels count];
}

-(NSUInteger) imperialCount{
    return [self.imperials count];
}

#pragma mark - Init
//En este caso vamos a sobreescribir el inicalizador en vez de crear uno propio
-(id)init{
    
    if ((self) = [super init]){
        
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
        
        self.rebels = @[chewie, yoda, c3po, r2d2];
        self.imperials = @[vader, palpatine, tarkin];
    }
    
    return self;
}

#pragma mark - indexes

-(RCRStarWarsCharacter *) imperialCharacterAtIndex:(NSUInteger) index{
    
    return [self.rebels objectAtIndex:index];
}

-(RCRStarWarsCharacter *) rebelCharacterAtIndex:(NSUInteger) index{
    
    return [self.imperials objectAtIndex:index];
}

@end
