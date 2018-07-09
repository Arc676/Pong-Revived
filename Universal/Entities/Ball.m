//
//  Ball.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/19/13.
//		<alesvinciguerra@gmail.com>
//Copyright (C) 2013-8 Arc676/Alessandro Vinciguerra

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

#import "Ball.h"

@implementation Ball

- (id) init{
    self.x = MAX_WIDTH/2;
    self.y = (MAX_HEIGHT - HEIGHT)/2;
    return [super init];
}

- (void) update:(SuperGame *)game{
	if(!self.moving){
        [self generateXDirection];
        [self generateYDirection];
        self.x = MAX_WIDTH/2;
        self.y = (MAX_HEIGHT - HEIGHT)/2;
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
	}else if(self.y >= MAX_HEIGHT){
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
