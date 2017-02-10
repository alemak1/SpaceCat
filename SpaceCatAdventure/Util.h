//
//  Util.h
//  SpaceCatAdventure
//
//  Created by Aleksander Makedonski on 2/10/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

#ifndef Util_h
#define Util_h

#import <Foundation/Foundation.h>

static const int PROJECTILE_SPEED = 400;


typedef NS_OPTIONS(uint32_t, CollisionCategory){
    CollisionCategoryEnemy          = 1 << 0,           //0000
    CollisionCategoryProjectile     = 1 << 1,           //0010
    CollisionCategoryDebris         = 1 << 2,           //0100
    CollisionCategoryGround         = 1 << 3            //1000
};


@interface Util : NSObject

+ (NSInteger) randomWithMin: (NSInteger)min max:(NSInteger)max;

@end

#endif /* Util_h */
