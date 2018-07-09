//
//  AI.m
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

#import "AI.h"

@implementation AI

- (id) init {
    self.x = MAX_WIDTH - 50;
    self.y = (MAX_HEIGHT - AI_HEIGHT) / 2;
    self.side = 1;
    return [super init];
}

- (void) update:(int)xmove x:(int)x y:(int)y {
    if (xmove == 0) {
        return;
    }
    if ((xmove > 0) != (self.side < 0)) {
        self.moving = NO;
        return;
    }
    if (self.y < y) {
        if (self.y >= MAX_HEIGHT - AI_HEIGHT) {
            return;
        }
        self.y++;
        self.moving = YES;
    }
    if (self.y > y) {
        self.y--;
        self.moving = YES;
    }
}

@end
