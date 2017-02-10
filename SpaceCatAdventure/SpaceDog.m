//
//  SpaceDog.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpaceDog.h"


@implementation SpaceDog

+ (instancetype) spaceDogOfType: (SpaceDogType)type{
    SpaceDog* spaceDog;
    
    if(type == SpaceDogTypeA){
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_A_1"];
    } else {
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_B_1"];
    }
    
    
    return spaceDog;
}


@end
