//
//  AI.h
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
#import "Entity.h"

#ifdef TARGET_OS_IOS

#define HEIGHT 100

#else

#define HEIGHT 100

#endif

@interface AI : Entity

@end
