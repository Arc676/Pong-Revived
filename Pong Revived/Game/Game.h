//
//  Game.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 9/29/13.
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

#import "SuperGame.h"
#import "Logger.h"

@interface Game : SuperGame

@property (assign) BOOL debug, cheats, W, S, UP, DOWN, enteringCmd;
@property (retain) NSString *lastPressedKey;
@property (retain) NSMutableString *cmdInput;
@property (retain) NSWindow *cmds;
@property (retain) Logger *log;

- (void) exec:(NSString*)str;
- (void) saveGame;
- (void) loadGame;

@end
