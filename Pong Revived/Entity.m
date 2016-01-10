//
//  Entity.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 11/6/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "Entity.h"

@implementation Entity

- (void) update:(BOOL)up down:(BOOL)down{}
- (void) update:(int)xmove x:(int)x y:(int)y{}
- (void) update:(Game *)game{}
- (void) generateXDirection{}
- (void) generateYDirection{}

@end
