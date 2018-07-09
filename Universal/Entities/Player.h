//
//  Player.h
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

#import "Game.h"
#import "Entity.h"

#ifdef TARGET_IOS

#define PLAYER_HEIGHT 100
#define START_X 50

#else

#define PLAYER_HEIGHT 100
#define START_X 50

#endif

@interface Player : Entity

@end
