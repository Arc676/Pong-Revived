//
//  Entity.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 11/6/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import <Foundation/Foundation.h>
@class Game;

@interface Entity : NSObject

@property (assign) int x, y, xmove, ymove, side;
@property (assign) BOOL moving;
@property (assign) float dirChange;

- (void) update:(BOOL)up down:(BOOL)down;
- (void) update:(int)xmove x:(int)x y:(int)y;
- (void) generateXDirection;
- (void) generateYDirection;
- (void) update:(Game*)game;

@end