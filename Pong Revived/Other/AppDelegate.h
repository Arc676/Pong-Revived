//
//  AppDelegate.h
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

#import <Cocoa/Cocoa.h>
#import "PvPGame.h"
#import "PvCGame.h"
#import "CvCGame.h"
#import "Logger.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
//methods linked to interface components
//methods linked to menu items to begin games
- (IBAction)newPvP:(id)sender;
- (IBAction)newPvC:(id)sender;
- (IBAction)newCvC:(id)sender;

//methods on the main menu and menu bar
- (IBAction)help:(id)sender;
- (IBAction)restoreMenu:(id)sender;
- (IBAction)customize:(id)sender;
- (IBAction)customizeColors:(id)sender;
- (IBAction)customizeUps:(id)sender;
- (IBAction)customizeBG:(id)sender;
- (IBAction)Begin:(id)sender;
- (IBAction)Quit:(id)sender;

//random update speeds
- (IBAction)randomUps:(id)sender;
- (IBAction)randomUps1:(id)sender;
- (IBAction)randomUps2:(id)sender;
- (IBAction)randomUps3:(id)sender;

//random colors
- (IBAction)randomBColor:(id)sender;
- (IBAction)randomRColor:(id)sender;
- (IBAction)randomLColor:(id)sender;
- (IBAction)randomNetColor:(id)sender;
- (IBAction)randomColors:(id)sender;
- (IBAction)randomBGColor:(id)sender;

//random chance
- (IBAction)randomChance:(id)sender;

//change chance
- (IBAction)changeChance:(id)sender;
- (IBAction)chanceChance1:(id)sender;

//set bg mode
- (IBAction)bgColorMode:(id)sender;
- (IBAction)bgImageMode:(id)sender;

//game management
- (void) newGame:(GameTypes)type;
- (IBAction)manageGames:(id)sender;
- (IBAction)closeGame:(id)sender;
- (IBAction)restoreGame:(id)sender;
@property (weak) IBOutlet NSTextField *gameIndex;

//logging
- (IBAction)showLog:(id)sender;
- (IBAction)clearLog:(id)sender;
@property (unsafe_unretained) IBOutlet NSWindow *logWindow;
@property (unsafe_unretained) IBOutlet Logger *log;

//instance windows
@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSPanel *helpWindow;
@property (weak) IBOutlet NSWindow *specsPanel;
@property (unsafe_unretained) IBOutlet NSPanel *commandsList;
@property (unsafe_unretained) IBOutlet NSWindow *colorWindow;
@property (unsafe_unretained) IBOutlet NSWindow *upsWindow;
@property (unsafe_unretained) IBOutlet NSWindow *bgPanel;
@property (retain) NSMutableArray *gameWindows;
@property (unsafe_unretained) IBOutlet NSPanel *manageGames;

//sounds
- (IBAction)toggleSound1:(id)sender;
@property (weak) IBOutlet NSPopUpButton *p1Sounds;

- (IBAction)toggleSound2:(id)sender;
@property (weak) IBOutlet NSPopUpButton *p2Sounds;

- (IBAction)toggleSound3:(id)sender;
@property (weak) IBOutlet NSPopUpButton *wallSounds;

//instance NSMatrix of radio buttons and individual buttons to select game type
@property (weak) IBOutlet NSButtonCell *PvP;
@property (weak) IBOutlet NSButtonCell *PvC;
@property (weak) IBOutlet NSButtonCell *CvC;
@property (weak) IBOutlet NSMatrix *gameModes;

//instance check boxes
@property (weak) IBOutlet NSButton *cmds;
@property (weak) IBOutlet NSButton *hollowStuff;
@property (weak) IBOutlet NSButton *disco;

//instance color wells to change game component colors
@property (weak) IBOutlet NSColorWell *bcolor;
@property (weak) IBOutlet NSColorWell *rcolor;
@property (weak) IBOutlet NSColorWell *lcolor;
@property (weak) IBOutlet NSColorWell *netColor;
@property (weak) IBOutlet NSColorWell *bgColor;

//background
@property (weak) IBOutlet NSImageView *bgImage;
@property (weak) IBOutlet NSMatrix *bgModes;
@property (weak) IBOutlet NSButtonCell *bgImageMode;
@property (weak) IBOutlet NSButtonCell *bgColorMode;
@property (weak) IBOutlet NSButton *randomBGColor;

//instance text fields to customize components' number of updates per second
@property (weak) IBOutlet NSTextField *bUps;
@property (weak) IBOutlet NSTextField *rUps;
@property (weak) IBOutlet NSTextField *lUps;

//instance textfield for probability of ball changing direction when bouncing off paddles
@property (weak) IBOutlet NSTextField *currentChance;
@property (weak) IBOutlet NSSlider *slider;

@end
