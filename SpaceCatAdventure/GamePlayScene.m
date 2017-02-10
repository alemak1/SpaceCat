//
//  GamePlayScene.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "GamePlayScene.h"
#import "MachineNode.h"
#import "SpaceCat.h"
#import "Projectile.h"
#import "SpaceDog.h"
#import "Ground.h"

@implementation GamePlayScene


- (void) didMoveToView:(SKView *)view{
    
    SKTexture* backgroundTexture = [SKTexture textureWithImageNamed:@"background_1"];
    SKNode* background = [SKSpriteNode spriteNodeWithTexture: backgroundTexture];
    
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    background.xScale = 1.4;
    background.yScale = 4;
    
    [self addChild: background];
    
    MachineNode* machine = [MachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 60)];
    [self addChild:machine];
    
    SpaceCat* spaceCat = [SpaceCat spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y-2)];
    
    [self addChild: spaceCat];

    [self addSpaceDog];
    
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    
    Ground* ground = [Ground groundWithSize:CGSizeMake(self.frame.size.width, 22)];
    [self addChild:ground];
    
}



- (void) addSpaceDog{
    SpaceDog* spaceDogA = [SpaceDog spaceDogOfType:SpaceDogTypeA];
    spaceDogA.position = CGPointMake(100, 1000);
    [self addChild: spaceDogA];
    
    SpaceDog* spaceDogB = [SpaceDog spaceDogOfType:SpaceDogTypeB];
    spaceDogB.position = CGPointMake(200, 1000);
    [self addChild:spaceDogB];
}


- (void)touchDownAtPoint:(CGPoint)pos {
    
}

- (void)touchMovedToPoint:(CGPoint)pos {
    
}

- (void)touchUpAtPoint:(CGPoint)pos {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
   
    for (UITouch* touch in touches) {
        CGPoint position = [touch locationInNode:self];
        [self shootProjectileTowardsPosition: position];
    }

    
    //    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}

- (void) shootProjectileTowardsPosition: (CGPoint)position{
    SpaceCat* spaceCat = (SpaceCat*)[self childNodeWithName:@"SpaceCat"];
    [spaceCat performTap];
    
    MachineNode* machine = (MachineNode*) [self childNodeWithName:@"Machine"];
    NSLog(@"The machine is at postion x: %f, y: %f",machine.position.x,machine.position.y);
    Projectile* projectile = [Projectile projectileAtPosition:CGPointMake(machine.position.x, machine.position.y + machine.frame.size.height-15)];
    [self addChild:projectile];
    [projectile moveTowardsPosition:position];
}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}



@end
