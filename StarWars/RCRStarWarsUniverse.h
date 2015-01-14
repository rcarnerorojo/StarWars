//
//  RCRStarWarsUniverse.h
//  StarWars
//
//  Created by Ramón Carnero Rojo on 14/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import Foundation;

#import "RCRStarWarsCharacter.h"

@interface RCRStarWarsUniverse : NSObject

//necesitamos el número porque lo pedirá la tabla
@property (nonatomic, readonly) NSUInteger imperialCount;
@property (nonatomic, readonly) NSUInteger rebelCount;

-(RCRStarWarsCharacter *) imperialCharacterAtIndex:(NSUInteger) index;
-(RCRStarWarsCharacter *) rebelCharacterAtIndex:(NSUInteger) index;

@end
