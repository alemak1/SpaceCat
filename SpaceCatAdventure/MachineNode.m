//
//  MachineNode.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MachineNode.h"

@implementation MachineNode

+ (instancetype) machineAtPosition: (CGPoint)position{
    MachineNode* machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position = position;
    machine.anchorPoint = CGPointMake(.5, 0);
    machine.yScale = 4;
    machine.xScale = 1.4;
    machine.name = @"Machine";

    NSArray* textures = @[[SKTexture textureWithImageNamed:@"machine_1"], [SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction* machineAction = [SKAction animateWithTextures: textures timePerFrame:0.05];
    SKAction* machineRepeat = [SKAction repeatActionForever:machineAction];
    
    [machine runAction:machineRepeat];
    
    return machine;
}


@end
