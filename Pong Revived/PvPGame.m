//
//  PvPGame.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/6/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "PvPGame.h"

@implementation PvPGame

- (BOOL) acceptsFirstResponder{
    return true;
}

- (id) init {
    self.entity1 = [[Player alloc] init];
    self.entity2 = [[Player alloc] init];
    [self.entity2 setX:700-50];
    [self.entity2 setSide:1];
    self.gameType = PvP;
    return [super init];
}

- (void) update{
    [super update];
    [self.entity1 update:self.W down:self.S];
    [self.entity2 update:self.UP down:self.DOWN];
    if(self.lpUps > 1){
        for(int i = 1; i < self.lpUps; i++){
            [self.entity1 update:self.W down:self.S];
        }
    }
    if(self.rpUps > 1){
        for(int i = 0; i < self.rpUps; i++){
            [self.entity2 update:self.UP down:self.DOWN];
        }
    }
}

@end