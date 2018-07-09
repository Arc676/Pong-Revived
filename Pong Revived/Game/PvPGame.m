//
//  PvPGame.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 10/6/13.
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

#import "PvPGame.h"

@implementation PvPGame

- (BOOL) acceptsFirstResponder {
    return true;
}

- (id) init {
    self.entity1 = [[Player alloc] init];
    self.entity2 = [[Player alloc] init];
    [self.entity2 setX:700 - 50];
    [self.entity2 setSide:1];
    self.gameType = PvP;
    return [super init];
}

- (void) update {
    [super update];
    [self.entity1 update:self.W down:self.S];
    [self.entity2 update:self.UP down:self.DOWN];
    if (self.lpUps > 1) {
        for(int i = 1; i < self.lpUps; i++) {
            [self.entity1 update:self.W down:self.S];
        }
    }
    if (self.rpUps > 1) {
        for(int i = 0; i < self.rpUps; i++) {
            [self.entity2 update:self.UP down:self.DOWN];
        }
    }
}

@end
