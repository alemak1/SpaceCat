//
//  SpaceDog.h
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#ifndef SpaceDog_h
#define SpaceDog_h

#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,SpaceDogType){
    SpaceDogTypeA = 0,
    SpaceDogTypeB = 1
};


@interface SpaceDog : SKSpriteNode


+ (instancetype) spaceDogOfType: (SpaceDogType)type;

@end
#endif /* SpaceDog_h */
