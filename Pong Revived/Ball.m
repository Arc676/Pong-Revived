//
//  Ball.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/19/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "Ball.h"

@implementation Ball

- (id) init{
    self.x = 700/2;
    self.y = 400/2;
    return [super init];
}

- (void) update:(Game *)game{
	if(!self.moving){
        [self generateXDirection];
        [self generateYDirection];
        self.x = 720/2-15;
        self.y = 400/2-15;
		self.moving = YES;
	}
    if(self.x <= 0){
        game.score2++;
        self.moving = NO;
        return;
	}
	if(self.x >= 720){
        game.score1++;
        self.moving = NO;
        return;
    }
	if(self.y <= 0){
		self.ymove *= -1;
        if (game.sound3) {
            [[NSSound soundNamed:game.sound3] play];
        }
	}else if(self.y >= 370){
        self.ymove *= -1;
        if (game.sound3) {
            [[NSSound soundNamed:game.sound3] play];
        }
    }
    if(self.x == game.entity1.x + 30 || self.x == game.entity1.x + 31){
        if (self.y <= game.entity1.y + 100 && self.y >= game.entity1.y - 30) {
            self.xmove *= -1;
            if (game.sound1) {
                [[NSSound soundNamed:game.sound1] play];
            }
            if (arc4random_uniform(101) < self.dirChange + (game.entity1.moving ? 20 : 0)) {
                [self generateYDirection];
            }
        }
    }
    if (self.x == game.entity2.x - 30 || self.x == game.entity2.x - 31) {
        if (self.y <= game.entity2.y + 100 && self.y >= game.entity2.y - 30) {
            self.xmove *= -1;
            if(game.sound2){
                [[NSSound soundNamed:game.sound2] play];
            }
            if (arc4random_uniform(101) < self.dirChange + (game.entity2.moving ? 20 : 0)) {
                [self generateYDirection];
            }
        }
    }
	self.x += self.xmove;
	self.y += self.ymove;
}

- (void) generateYDirection{
    self.ymove = arc4random_uniform(3);
    if(arc4random_uniform(2)){
        self.ymove *= -1;
    }
}

- (void) generateXDirection{
    while (self.xmove <= 0){
        self.xmove = arc4random_uniform(3);
    }
    if (arc4random_uniform(2)){
        self.xmove *= -1;
    }
}

@end
