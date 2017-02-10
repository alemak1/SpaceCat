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

+ (instancetype) projectileAtPosition: (CGPoint)position{
    Projectile * projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.yScale = 4;
    projectile.xScale = 1.4;
    projectile.name = @"Projectile";
    
    return projectile;
}


@end
