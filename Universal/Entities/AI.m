//
//  AI.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/19/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "AI.h"

@implementation AI

- (id) init{
    self.x = MAX_WIDTH-50;
    self.y = (MAX_HEIGHT - HEIGHT)/2;
    self.side = 1;
    return [super init];
}

- (void) update:(int)xmove x:(int)x y:(int)y{
    if(xmove == 0){
        return;
    }
    if((xmove > 0) != (self.side < 0)){
        self.moving = NO;
        return;
    }
    if(self.y < y){
        if(self.y >= MAX_HEIGHT - HEIGHT){
            return;
        }
        self.y++;
        self.moving = YES;
    }
    if(self.y > y){
        self.y--;
        self.moving = YES;
    }
}

@end
