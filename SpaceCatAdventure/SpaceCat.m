//
//  SpaceCat.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpaceCat.h"

@implementation SpaceCat

+ (instancetype) spaceCatAtPosition: (CGPoint)position{
    SpaceCat* spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.yScale = 4;
    spaceCat.xScale = 1.4;
    spaceCat.position = position;
    
    SKAction* spaceCatAction = [SKAction animateWithTextures: @[
                                [SKTexture textureWithImageNamed:@"spacecat_1"],
                                [SKTexture textureWithImageNamed:@"spacecat_2"]]
                            timePerFrame:0.1];
    
    SKAction * repeatAction = [SKAction repeatActionForever:spaceCatAction];
    [spaceCat runAction:repeatAction];
    
    return spaceCat;
}


@end
