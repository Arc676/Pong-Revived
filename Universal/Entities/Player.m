//
//  Player.m
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

#import "Player.h"

@implementation Player

- (id) init {
    self.x = START_X;
    self.y = (MAX_HEIGHT - PLAYER_HEIGHT) / 2;
    self.side = -1;
    return [super init];
}

- (void) update:(BOOL)up down:(BOOL)down {
    if (up) {
        if (!down) {
            self.moving = YES;
        }
        if (self.y <= MAX_HEIGHT - PLAYER_HEIGHT) {
            self.y++;
        }
    }
    if (down) {
        if (!up) {
            self.moving = YES;
        }
        if (self.y >= 0) {
            self.y--;
        }
    }
    if (!down && !up) {
        self.moving = NO;
    }
}

@end
