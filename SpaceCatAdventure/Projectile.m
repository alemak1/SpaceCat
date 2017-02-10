//
//  Projectile.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Projectile.h"


@implementation Projectile

- (void) setupAnimation{
    NSArray* textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
                          [SKTexture textureWithImageNamed:@"projectile_2"],
                          [SKTexture textureWithImageNamed:@"projectile_3"]
                          ];
    
    SKAction* projectileAction = [SKAction animateWithTextures: textures timePerFrame:0.10];
    
    SKAction* repeatAction = [SKAction repeatActionForever: projectileAction];
    
    [self runAction: repeatAction];
}


+ (instancetype) projectileAtPosition: (CGPoint)position{
    Projectile * projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.yScale = 4;
    projectile.xScale = 1.4;
    projectile.name = @"Projectile";
    [projectile setupAnimation];
    
    return projectile;
}



@end
