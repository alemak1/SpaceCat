//
//  SpaceCat.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpaceCat.h"

@interface SpaceCat ()

@property (nonatomic) SKAction* tapAction;

@end

@implementation SpaceCat

+ (instancetype) spaceCatAtPosition: (CGPoint)position{
    SpaceCat* spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.yScale = 4;
    spaceCat.xScale = 1.4;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    spaceCat.position = position;
    spaceCat.name = @"SpaceCat";
   
    return spaceCat;
}

- (void) performTap{
    [self runAction:self.tapAction];
}

- (SKAction*) tapAction{
    if( _tapAction != nil){
        return _tapAction;
    }
    
    NSArray* textures = @[[SKTexture textureWithImageNamed:@"spacecat_2"],
                          [SKTexture textureWithImageNamed:@"spacecat_1"]];
    
    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.1];
    
    return _tapAction;
}


@end
