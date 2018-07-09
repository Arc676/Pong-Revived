//
//  PvCGame.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/6/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "PvCGame.h"

@implementation PvCGame

- (id) init {
    self.entity1 = [[Player alloc] init];
    self.entity2 = [[AI alloc] init];
    self.gameType = PvC;
    return [super init];
}

- (BOOL) acceptsFirstResponder{
    return YES;
}

- (void) update{
    [super update];
    [self.entity1 update:self.W down:self.S];
    [self.entity2 update:self.ball.xmove x:self.ball.x y:self.ball.y];
    if(self.lpUps > 1){
        for(int i = 1; i < self.lpUps; i++){
            [self.entity1 update:self.W down:self.S];
        }
    }
    if(self.rpUps > 1){
        for(int i = 0; i < self.rpUps; i++){
            [self.entity2 update:self.ball.xmove x:self.ball.x y:self.ball.y];
        }
    }
}

@end