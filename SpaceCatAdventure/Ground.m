//
//  Ground.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ground.h"

@implementation Ground

+ (instancetype) groundWithSize:(CGSize)size{
    Ground* ground = [self spriteNodeWithColor:[SKColor redColor] size:size];
    ground.name = @"Ground";
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    ground.position = CGPointMake(size.width/2, size.height/2);
    
    return ground;
}

@end
