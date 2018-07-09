//
//  Player.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/19/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "Game.h"
#import "Entity.h"

#ifdef TARGET_OS_IOS

#define HEIGHT 100
#define START_X 50

#else

#define HEIGHT 100
#define START_X 50

#endif

@interface Player : Entity

@end