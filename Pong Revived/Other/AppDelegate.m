//
//  AppDelegate.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 9/11/13.
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

#import "AppDelegate.h"
#import "PvPGame.h"
#import "PvCGame.h"
#import "CvCGame.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)Notification {
    [self.log log:@"Launched Pong Revived"];
    [self bgColorMode:nil];
    self.gameWindows = [[NSMutableArray alloc] init];
}

- (IBAction)help:(id)sender {
    [self.helpWindow setIsVisible:YES];
    [self.log log:@"Showed help"];
}

- (IBAction)Quit:(id)sender {
    [NSApp terminate:self];
}

- (IBAction)restoreMenu:(id)sender {
    [self.window setIsVisible:YES];
    [self.log log:@"Restored main menu"];
}

- (IBAction)Begin:(id)sender {
	[self.window setIsVisible:NO];
	if ([self.gameModes selectedCell] == self.PvP) {
        [self newGame:PvP];
        [self.log log:@"Started new PvP game via main menu"];
	} else if ([self.gameModes selectedCell] == self.PvC) {
        [self newGame:PvC];
        [self.log log:@"Started new PvC game via main menu"];
	} else if ([self.gameModes selectedCell] == self.CvC) {
        [self newGame:CvC];
        [self.log log:@"Started new CvC game via main menu"];
	} else {
		NSLog(@"[self.gameModes selectedCell] does not return any of the NSButtonCells declared in AppDelegate.h!");
        [self.log log:@"Error: [self.gameModes selectedCell] does not return any of the NSButtonCells declared in AppDelegate.h"];
	}
}

- (IBAction)customize:(id)sender {
    [self.specsPanel setIsVisible:YES];
    [self.log log:@"Showed customization panel"];
}

- (IBAction)customizeColors:(id)sender {
    [self.colorWindow setIsVisible:YES];
    [self.log log:@"Showed color customization panel"];
}

- (IBAction)customizeUps:(id)sender {
    [self.upsWindow setIsVisible:YES];
    [self.log log:@"Showed update frequency customization panel"];
}

- (IBAction)customizeBG:(id)sender {
    [self.bgPanel setIsVisible:YES];
    [self.log log:@"Showed background customization panel"];
}

- (IBAction)showLog:(id)sender {
	[self.logWindow setIsVisible:YES];
    [self.log log:@"Showed log"];
}

- (IBAction)clearLog:(id)sender {
	[self.log setString:@""];
    [self.log log:@"Cleared log"];
}

- (IBAction)randomUps:(id)sender {
    [self randomUps1:sender];
    [self randomUps2:sender];
    [self randomUps3:sender];
    [self.log log:@"Randomized all update frequencies"];
}

- (IBAction)randomUps1:(id)sender {
    float ups = arc4random_uniform(5);
    if (ups == 0.0) {
        ups = 0;
    }
    [self.lUps setFloatValue:ups + 1];
    [self.log log:@"Randomized left player update frequency"];
}

- (IBAction)randomUps2:(id)sender {
    float ups = arc4random_uniform(5);
    if (ups == 0.0) {
        ups = 0;
    }
    [self.rUps setFloatValue:ups + 1];
    [self.log log:@"Randomized right player update frequency"];
}

- (IBAction)randomUps3:(id)sender {
    float ups = arc4random_uniform(5);
    if (ups == 0.0) {
        ups = 0;
    }
    [self.bUps setFloatValue:ups + 1];
    [self.log log:@"Randomized ball update frequency"];
}

- (IBAction)randomBColor:(id)sender {
    int R = arc4random_uniform(256);
    int G = arc4random_uniform(256);
    int B = arc4random_uniform(256);
    NSColor *newcolor = [NSColor colorWithCalibratedRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
    [self.bcolor setColor:newcolor];
    [self.log log:@"Randomized ball color"];
}

- (IBAction)randomRColor:(id)sender {
    int R = arc4random_uniform(256);
    int G = arc4random_uniform(256);
    int B = arc4random_uniform(256);
    NSColor *newcolor = [NSColor colorWithCalibratedRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
    [self.rcolor setColor:newcolor];
    [self.log log:@"Randomized right player color"];
}

- (IBAction)randomLColor:(id)sender {
    int R = arc4random_uniform(256);
    int G = arc4random_uniform(256);
    int B = arc4random_uniform(256);
    NSColor *newcolor = [NSColor colorWithCalibratedRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
    [self.lcolor setColor:newcolor];
    [self.log log:@"Randomized left player color"];
}

- (IBAction)randomNetColor:(id)sender {
    int R = arc4random_uniform(256);
    int G = arc4random_uniform(256);
    int B = arc4random_uniform(256);
    NSColor *newcolor = [NSColor colorWithCalibratedRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
    [self.netColor setColor:newcolor];
	[self.log log:@"Randomized net color"];
}

- (IBAction)randomChance:(id)sender {
    float f = arc4random_uniform(101);
    [self.currentChance setFloatValue:f];
    [self.slider setFloatValue:f];
	[self.log log:@"Randomized chance of ball changing direction after bouncing off paddles"];
}

- (IBAction)randomColors:(id)sender {
    [self randomBColor:sender];
    [self randomLColor:sender];
    [self randomRColor:sender];
    [self randomNetColor:sender];
	[self.log log:@"Randomized all colors"];
}

- (IBAction)randomBGColor:(id)sender {
    @autoreleasepool {
        int R = arc4random_uniform(256);
        int G = arc4random_uniform(256);
        int B = arc4random_uniform(256);
        NSColor *newcolor = [NSColor colorWithCalibratedRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
        [self.bgColor setColor:newcolor];
        [self.log log:@"Randomized background color"];
    }
}

- (IBAction)changeChance:(id)sender {
    float f = [sender floatValue];
    [self.currentChance setFloatValue:f];
	[self.log log:[NSString stringWithFormat:@"Changed chance to %f", f]];
}

- (IBAction)chanceChance1:(id)sender {
    float f = [sender floatValue];
    [self.slider setFloatValue:f];
	[self.log log:[NSString stringWithFormat:@"Changed change to %f", f]];
}

- (IBAction)newPvP:(id)sender {
    [self.window setIsVisible:NO];
	[self newGame:PvP];
    [self.log log:@"Started new PvP game"];
}

- (IBAction)newPvC:(id)sender {
    [self.window setIsVisible:NO];
	[self newGame:PvC];
    [self.log log:@"Started new PvC game"];
}

- (IBAction)newCvC:(id)sender {
    [self.window setIsVisible:NO];
	[self newGame:CvC];
    [self.log log:@"Started new CvC game"];
}

- (void) newGame:(GameTypes)type {
    if ([self.gameWindows count] >= 50) {
        [[NSAlert alertWithMessageText:@"Warning" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"50 games are already open. Please close some using File > Manage Open Games"] runModal];
        return;
    }
    NSSize size = [[NSScreen mainScreen] frame].size;
    NSRect rect = NSMakeRect(size.width / 2 - 720 / 2, size.height / 2 - 400 / 2, 720, 400);
    NSWindow *gameWindow = [[NSWindow alloc] initWithContentRect:rect styleMask:NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask backing:NSBackingStoreBuffered defer:YES];
    Game *game;
    if (type == PvP) {
        game = [[PvPGame alloc] init];
    } else if (type == PvC) {
        game = [[PvCGame alloc] init];
    } else if (type == CvC) {
        game = [[CvCGame alloc] init];
    }

    [game setLog:self.log];
    [game setCmds:self.commandsList];

    [game setHollow:[self.hollowStuff floatValue]];
    [game setCheats:[self.cmds floatValue]];
    [game setDisco:[self.disco floatValue]];

    [game setLpUps:[self.lUps intValue]];
    [game setRpUps:[self.rUps intValue]];
    [game setBUps:[self.bUps intValue]];

    [game setLcolor:[self.lcolor color]];
    [game setRcolor:[self.rcolor color]];
    [game setBcolor:[self.bcolor color]];
    [game setNetcolor:[self.netColor color]];
    if (self.bgModes.selectedCell == self.bgColorMode) {
        game.imageBG = NO;
        [game setBgcolor:[self.bgColor color]];
    } else {
        game.imageBG = YES;
        [game setBgImage:[self.bgImage image]];
    }

    if ([self.p1Sounds isEnabled]) {
        [game setSound1:self.p1Sounds.titleOfSelectedItem];
    }
    if ([self.p2Sounds isEnabled]) {
        [game setSound2:self.p2Sounds.titleOfSelectedItem];
    }
    if ([self.wallSounds isEnabled]) {
        [game setSound3:self.wallSounds.titleOfSelectedItem];
    }

    [game.ball setDirChange:[self.currentChance floatValue]];

    [self.gameWindows addObject:gameWindow];

    [gameWindow setTitle:[NSString stringWithFormat:@"Pong: Game (Index: %d)",(int)[self.gameWindows count] - 1]];
    [gameWindow setReleasedWhenClosed:NO];
    [gameWindow setContentView:game];
    [gameWindow makeFirstResponder:game];
    [gameWindow setIsVisible:YES];
    [game setNeedsDisplay:YES];

    [NSTimer scheduledTimerWithTimeInterval:(1.0 / 60.0)
              target:game
              selector:@selector(setNeedsDisplay:)
              userInfo:nil
              repeats:YES];
}

- (IBAction)manageGames:(id)sender {
    [self.manageGames setIsVisible:YES];
    [self.log log:@"Opened Game Manager"];
}

- (IBAction)closeGame:(id)sender {
    int index = [self.gameIndex intValue];
    if (index < 0 || index >= [self.gameWindows count] || [self.gameWindows count] == 0) {
        [self.gameIndex setStringValue:@"Invalid input"];
        return;
    }
    [[self.gameWindows objectAtIndex:index] setIsVisible:NO];
    [self.gameWindows removeObjectAtIndex:index];
    [self.log log:[NSString stringWithFormat:@"Removed game at index %d",index]];
    for (int i = index; i < [self.gameWindows count]; i++) {
        @autoreleasepool {
            NSString *newTitle = [NSString stringWithFormat:@"Pong: Game (Index: %d)",i];
            [[self.gameWindows objectAtIndex:i] setTitle:newTitle];
        }
    }
    [self.log log:@"Updated game indices"];
}

- (IBAction)restoreGame:(id)sender {
    int index = [self.gameIndex intValue];
    if (index < 0 || index > [self.gameWindows count]) {
        [self.gameIndex setStringValue:@"Invalid input"];
        return;
    }
    [[self.gameWindows objectAtIndex:index] setIsVisible:YES];
}

- (IBAction)newMultiplayer:(id)sender {
}

- (IBAction)toggleSound1:(id)sender {
    [self.p1Sounds setEnabled:[sender floatValue]];
    [self.log log:[NSString stringWithFormat:@"New sound activation value for left player is %@", ([sender floatValue] ? @"true" : @"false")]];
}

- (IBAction)toggleSound2:(id)sender {
    [self.p2Sounds setEnabled:[sender floatValue]];
    [self.log log:[NSString stringWithFormat:@"New sound activation value for right player is %@", ([sender floatValue] ? @"true" : @"false")]];
}

- (IBAction)toggleSound3:(id)sender {
    [self.wallSounds setEnabled:[sender floatValue]];
    [self.log log:[NSString stringWithFormat:@"New sound activation value for walls 1 is %@", ([sender floatValue] ? @"true" : @"false")]];
}

- (IBAction)bgColorMode:(id)sender {
    [self.bgImage setEditable:NO];
    [self.bgColor setEnabled:YES];
    [self.randomBGColor setEnabled:YES];
}

- (IBAction)bgImageMode:(id)sender {
    [self.bgImage setEditable:YES];
    [self.bgColor setEnabled:NO];
    [self.randomBGColor setEnabled:NO];
}

@end
