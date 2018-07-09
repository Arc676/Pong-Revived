//
//  Ball.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/19/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "Entity.h"

#ifdef TARGET_OS_IOS

#define HEIGHT 30

#else

#define HEIGHT 30

#endif

@class SuperGame;

@interface Ball : Entity

@end