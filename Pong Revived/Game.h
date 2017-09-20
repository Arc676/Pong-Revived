//
//  Game.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 9/29/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

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