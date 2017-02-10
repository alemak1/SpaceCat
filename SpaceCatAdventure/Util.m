//
//  Util.m
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Util.h"

@implementation Util

+ (NSInteger) randomWithMin: (NSInteger)min max:(NSInteger)max{
    return arc4random()%(max-min) + min;
}


@end
