//
//  GamePlayScene.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GamePlayScene.h"
#import "MachineNode.h"
#import "SpaceCat.h"

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

    
}





- (void)touchDownAtPoint:(CGPoint)pos {
    
}

- (void)touchMovedToPoint:(CGPoint)pos {
    
}

- (void)touchUpAtPoint:(CGPoint)pos {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
   
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


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
    NSLog(@"%f",fmod(currentTime, 60));
}



@end
