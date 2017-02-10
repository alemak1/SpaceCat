//
//  Projectile.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Projectile.h"
#import "Constants.h"

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

- (void) moveTowardsPosition: (CGPoint) position{
    //slope = (Y3 - Y1) / (X3 - X1)
    float slope = (position.y - self.position.y)/ (position.x - self.position.x);
    
    //slope = (Y2 - Y1) / (X2 - X1)
    // Y2 - Y1 = slope * (X2 - X1)
    // Y2 = slope*X2 - slope*X1 + Y1
    
    float offScreenX;
    
    if (position.x <= self.position.x){
        offScreenX = -10;
    } else {
        offScreenX = self.parent.frame.size.width + 10;
    }
    
    float offScreenY = slope*offScreenX - slope*self.position.x + self.position.y;
    
    CGPoint pointOffScreen = CGPointMake(offScreenX, offScreenY);
    
    float distanceA = pointOffScreen.y - self.position.y;
    float distanceB = pointOffScreen.x - self.position.x;
    
    float distanceC = sqrtf(powf(distanceA, 2) + powf(distanceB, 2));
    
    //time = distance / speed
    
    float time = distanceC / PROJECTILE_SPEED;
    
    
    SKAction* moveProjectile = [SKAction moveTo:pointOffScreen duration:time];
    [self runAction: moveProjectile];
    
}

@end
