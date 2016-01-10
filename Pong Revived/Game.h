//
//  Game.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 9/29/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "Logger.h"
@class Ball;

typedef enum GameTypes{
    PvP,
    PvC,
    CvC
}GameTypes;

@interface Game : NSView

@property (assign) int lpUps, rpUps, bUps, score1, score2;
@property (assign) BOOL hollow, debug, paused, disco, cheats, W, S, UP, DOWN, imageBG, fastball, enteringCmd;
@property (assign) GameTypes gameType;

@property (retain) NSColor *lcolor, *rcolor, *bcolor, *netcolor, *bgcolor; //colors of game components
@property (retain) NSArray *scores; //images of scores
@property (retain) NSString *lastPressedKey;
@property (retain) NSMutableString *cmdInput;
@property (retain) NSWindow *cmds;
@property (retain) NSImage *bgImage;
@property (retain) Entity *ball, *entity1, *entity2;
@property (retain) NSString *sound1 /*P1*/, *sound2 /*P2*/, *sound3 /*Walls*/;
@property (retain) Logger *log;

- (void) update;
- (void) exec:(NSString*)str;
- (void) resetPlayers;
- (void) saveGame;
- (void) loadGame;

@end