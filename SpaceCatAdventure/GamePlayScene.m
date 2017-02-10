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
#import "Util.h"


@interface GamePlayScene ()

@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) NSTimeInterval timeSinceEnemyAdded;

@end


@implementation GamePlayScene


- (void) didMoveToView:(SKView *)view{
    
    self.lastUpdateTimeInterval = 0;
    self.timeSinceEnemyAdded = 0;
    
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

    
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    self.physicsWorld.contactDelegate = self;
    
    Ground* ground = [Ground groundWithSize:CGSizeMake(self.frame.size.width, 22)];
    [self addChild:ground];
    
}



- (void) addSpaceDog{
    NSUInteger randomSpaceDog = [Util randomWithMin:0 max:2];
    
    SpaceDog* spaceDog = [SpaceDog spaceDogOfType:randomSpaceDog];
    float dy = [Util randomWithMin: SpaceDogMinSpeed max: SpaceDogMaxSpeed];
    
    spaceDog.physicsBody.velocity = CGVectorMake(0, dy);

    float y = self.frame.size.height + spaceDog.size.height;
    float x = [Util randomWithMin:10+spaceDog.size.width
                              max:self.frame.size.width-spaceDog.size.width-10];
    
    spaceDog.position = CGPointMake(x, y);
    [self addChild:spaceDog];
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
    if(self.lastUpdateTimeInterval){
        self.timeSinceEnemyAdded += currentTime - self.lastUpdateTimeInterval;
    }
    
    if(self.timeSinceEnemyAdded > 1.5){
        [self addSpaceDog];
        
        self.timeSinceEnemyAdded = 0;
    }

    self.lastUpdateTimeInterval = currentTime;
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    SKPhysicsBody* firstBody, *secondBody;
    
    if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    
    if (firstBody.categoryBitMask == CollisionCategoryEnemy && secondBody.categoryBitMask == CollisionCategoryProjectile){
        NSLog(@"BAM");
        SpaceDog* spaceDog = (SpaceDog*) firstBody.node;
        Projectile* projectile = (Projectile*) secondBody.node;
        
        [spaceDog removeFromParent];
        [projectile removeFromParent];
        
    } else if (firstBody.categoryBitMask == CollisionCategoryEnemy && secondBody.categoryBitMask == CollisionCategoryGround){
        NSLog(@"Hit ground");
        
        SpaceDog* spaceDog = (SpaceDog*) firstBody.node;
        
        [spaceDog removeFromParent];
    }
    
    [self createDebrisAtPosition: contact.contactPoint];

}

- (void) createDebrisAtPosition: (CGPoint)position{
    NSInteger numberOfPieces = [Util randomWithMin:5 max:20];
    
    NSString* imageName;
    
    for (int i = 0; i < numberOfPieces; i++) {
        NSInteger randomPiece = [Util randomWithMin:1 max:4];
        NSString* imageName = [NSString stringWithFormat:@"debri_%d",randomPiece];
        
        SKSpriteNode* debris = [SKSpriteNode spriteNodeWithImageNamed:imageName];
        debris.position = position;
        [self addChild:debris];
        
        debris.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:debris.frame.size];
        debris.physicsBody.categoryBitMask = CollisionCategoryDebris;
        debris.physicsBody.contactTestBitMask = 0;
        debris.physicsBody.collisionBitMask = CollisionCategoryGround | CollisionCategoryDebris;
        
        debris.name = @"Debris";
        debris.physicsBody.velocity = CGVectorMake(
                                                   [Util randomWithMin:-150 max:150],
                                                   [Util randomWithMin:150 max:350]);
        
        [debris runAction:[SKAction waitForDuration:2.0] completion: ^{
            [debris removeFromParent];
        }];
        
    }
}

@end
