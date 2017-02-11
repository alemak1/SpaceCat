//
//  HUDNode.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/11/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUDNode.h"

@implementation HUDNode

+ (instancetype) hudAtPosition: (CGPoint)position inFrame:(CGRect)frame{
    HUDNode * hudNode = [self node];
    hudNode.position = position;
    hudNode.zPosition = 10;
    
    
    SKSpriteNode *catHead = [SKSpriteNode spriteNodeWithImageNamed:@"HUD_cat_1"];
    catHead.position = CGPointMake(40, -10);
    
    [hudNode addChild:catHead];
    
    
    hudNode.lives = MaxLives;
    
    SKSpriteNode * lastLifeBar;
    
    for (int i = 0; i < hudNode.lives; i++) {
        SKSpriteNode * lifeBar = [SKSpriteNode spriteNodeWithImageNamed:@"HUD_life_1"];
        lifeBar.name = [NSString stringWithFormat:@"Life%d",i+1];
        [hudNode addChild: lifeBar];
        
        if(lastLifeBar == nil) {
            lifeBar.position = CGPointMake(catHead.position.x + 30, catHead.position.y);
        } else {
            lifeBar.position = CGPointMake(lastLifeBar.position.x + 10, lastLifeBar.position.y);
        }
        
        lastLifeBar = lifeBar;
    }
    
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    scoreLabel.name = @"Score";
    scoreLabel.text = @"0";
    scoreLabel.fontSize = 24;
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    scoreLabel.position = CGPointMake(frame.size.width-20, -10);
    [hudNode addChild:scoreLabel];
    
    
    return hudNode;

}

@end
