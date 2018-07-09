//
//  SuperGame.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 1/10/16.
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

#import <Foundation/Foundation.h>
#ifdef TARGET_IOS
#import <UIKit/UIKit.h>
#endif

#ifdef TARGET_IOS
//iOS data types
#define Rect CGRect
#define Color UIColor
#define View UIView
#define Image UIImage

#else
//Mac data types
#define Rect NSRect
#define Color NSColor
#define View NSView
#define Image NSImage

#endif

#import "Entity.h"

typedef enum GameTypes{
    PvP,
    PvC,
    CvC
}GameTypes;

@interface SuperGame : View

@property (retain) Color *lcolor, *rcolor, *bcolor, *netcolor, *bgcolor; //colors of game components
@property (retain) Image *bgImage;
@property (retain) NSArray *scores; //images of scores
@property (assign) GameTypes gameType;
@property (assign) int lpUps, rpUps, bUps, score1, score2;
@property (assign) BOOL hollow, paused, disco, imageBG, fastball;
@property (retain) Entity *ball, *entity1, *entity2;
@property (retain) NSString *sound1 /*P1*/, *sound2 /*P2*/, *sound3 /*Walls*/;

- (void) update;
- (void) resetPlayers;

@end
