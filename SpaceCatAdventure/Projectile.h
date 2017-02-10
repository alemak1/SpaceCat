//
//  Projectile.h
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Projectile : SKSpriteNode

+ (instancetype) projectileAtPosition: (CGPoint)position;

- (void) setupAnimation;

@end


