//
//  SpaceCat.h
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpaceCat : SKSpriteNode

+ (instancetype) spaceCatAtPosition: (CGPoint)position;

- (void) performTap;

@end
