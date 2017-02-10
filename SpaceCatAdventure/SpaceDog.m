//
//  SpaceDog.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "SpaceDog.h"


@implementation SpaceDog

+ (instancetype) spaceDogOfType: (SpaceDogType)type{
    SpaceDog* spaceDog;
    
    NSArray* textures;
    
    if(type == SpaceDogTypeA){
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_A_1"];
        textures = @[[SKTexture textureWithImageNamed:@"spacedog_A_1"],
                     [SKTexture textureWithImageNamed:@"spacedog_A_2"],
                     [SKTexture textureWithImageNamed:@"spacedog_A_3"]];
    } else {
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_B_1"];
        
        textures = @[[SKTexture textureWithImageNamed:@"spacedog_B_1"],
                     [SKTexture textureWithImageNamed:@"spacedog_B_2"],
                     [SKTexture textureWithImageNamed:@"spacedog_B_3"]];
    }
    
    spaceDog.yScale = 5;
    spaceDog.xScale = 1.4;
    
    SKAction * animation = [SKAction animateWithTextures:textures timePerFrame:0.10];
    [spaceDog runAction:[SKAction repeatActionForever:animation]];
    
   
    return spaceDog;
}


@end
