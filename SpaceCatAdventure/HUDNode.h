//
//  HUDNode.h
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/11/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#ifndef HUDNode_h
#define HUDNode_h

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Util.h"

@interface HUDNode : SKNode

@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;

+ (instancetype) hudAtPosition: (CGPoint)position inFrame: (CGRect)frame;

- (void) addPoints: (NSInteger) points;
- (BOOL) loseLife;

@end

#endif /* HUDNode_h */
