//
//  Entity.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 11/6/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import <Foundation/Foundation.h>
@class SuperGame;

#ifdef TARGET_OS_IOS

#define MAX_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define MAX_WIDTH ([UIScreen mainScreen].bounds.size.width)

#else

#define MAX_HEIGHT 400

#endif

@interface Entity : NSObject

@property (assign) int x, y, xmove, ymove, side;
@property (assign) BOOL moving;
@property (assign) float dirChange;

- (void) update:(BOOL)up down:(BOOL)down;
- (void) update:(int)xmove x:(int)x y:(int)y;
- (void) generateXDirection;
- (void) generateYDirection;
- (void) update:(SuperGame*)game;

@end