//
//  Game.m
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

#import "Game.h"
#import "Ball.h"

@implementation Game

- (id) init {
    self.cmdInput = [NSMutableString string];
    self.scores = [NSArray arrayWithObjects:
                   [NSImage imageNamed:@"0.png"],
                   [NSImage imageNamed:@"1.png"],
                   [NSImage imageNamed:@"2.png"],
                   [NSImage imageNamed:@"3.png"],
                   [NSImage imageNamed:@"4.png"],
                   [NSImage imageNamed:@"5.png"],
                   [NSImage imageNamed:@"6.png"],
                   [NSImage imageNamed:@"7.png"],
                   [NSImage imageNamed:@"8.png"],
                   [NSImage imageNamed:@"9.png"],
                   [NSImage imageNamed:@"10.png"],
                   nil];
    if (self.lpUps <= 0) self.lpUps = 1;
    if (self.rpUps <= 0) self.rpUps = 1;
    if (self.bUps <= 0) self.bUps = 1;
    self.ball = [[Ball alloc] init];
    return [super init];
}

- (void) drawRect:(NSRect)rect {
    if (self.imageBG) {
        [[NSColor blackColor] set];
        NSRectFill(rect);
        [self.bgImage drawInRect:NSMakeRect(0, 0, 700, 480)];
    } else {
        [self.bgcolor set];
        NSRectFill(rect);
    }
    [self.netcolor set];
    for (int i = 0; i < 400 - 30; i += 60) {
        NSString *str = [NSString stringWithFormat:@"%d %d %d %d", 720 / 2 - 5, i, 10, 50];
        if (self.hollow) {
            NSFrameRect(NSRectFromString(str));
        } else {
            NSRectFill(NSRectFromString(str));
        }
    }

	[self.lcolor set];
    NSString *str1 = [NSString stringWithFormat:@"%d %d %d %d", self.entity1.x, self.entity1.y, 30, 100];
    if (self.hollow) {
        NSFrameRect(NSRectFromString(str1));
    } else {
        NSRectFill(NSRectFromString(str1));
    }

	[self.rcolor set];
    str1 = [NSString stringWithFormat:@"%d %d %d %d", self.entity2.x, self.entity2.y, 30, 100];
    if (self.hollow) {
        NSFrameRect(NSRectFromString(str1));
    } else {
        NSRectFill(NSRectFromString(str1));
    }

	if (self.disco) {
        int r = arc4random_uniform(256), g = arc4random_uniform(256), b = arc4random_uniform(256);
        NSColor *color = [NSColor colorWithCalibratedRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0];
        [color set];
    } else {
        [self.bcolor set];
    }
    str1 = [NSString stringWithFormat:@"%d %d %d %d", self.ball.x, self.ball.y, 30, 30];
    if (self.hollow) {
        NSFrameRect(NSRectFromString(str1));
    } else {
        NSRectFill(NSRectFromString(str1));
    }

    if (self.debug) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,[NSColor whiteColor], NSForegroundColorAttributeName, nil];

        NSString *p1 = [NSString stringWithFormat:@"P1 - x:%d, y:%d", self.entity1.x, self.entity1.y];
        NSString *p2 = [NSString stringWithFormat:@"P2 - x:%d, y:%d", self.entity2.x, self.entity2.y];
        NSString *ball = [NSString stringWithFormat:@"Ball - x:%d, y:%d", self.ball.x, self.ball.y];
        NSString *scores = [NSString stringWithFormat:@"Score - %d:%d", self.score1, self.score2];
        NSString *ups = [NSString stringWithFormat:@"Update Speed - P1:%d, P2:%d, Ball:%d", self.lpUps, self.rpUps, self.bUps];
        NSString *bools1 = [NSString stringWithFormat:@"Debug mode:%@; Cheats mode:%@", (self.debug ? @"true" : @"false"), (self.cheats ? @"true" : @"false")];
        NSString *bools2 = [NSString stringWithFormat:@"Disco ball:%@; Paused:%@", (self.disco ? @"true" : @"false"), (self.paused ? @"true" : @"false")];
        NSString *dirchange = [NSString stringWithFormat:@"dirChange value:%f", self.ball.dirChange];
        NSRange range = [dirchange rangeOfString:@"."];
        dirchange = [dirchange substringToIndex:range.location];
        NSString *lastKey = [NSString stringWithFormat:@"Last pressed key:%@", self.lastPressedKey];

        NSAttributedString *currentText=[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@", p1, p2, ball, scores, ups, bools1, bools2, dirchange, lastKey] attributes: attributes];
        [currentText drawAtPoint:NSMakePoint(50, 60)];
    }

    if (self.score1 == 10) {
        NSImage *text = [NSImage imageNamed:@"P1Win.png"];
        NSRect textrect = NSMakeRect(720 - 300, 50, 290, 50);
        NSRect bgrect = NSMakeRect(720 - 300 - 10, 50 - 10, 290 + 20, 50 + 20);
    	[[NSColor blackColor] set];
        NSRectFill(bgrect);
        [text drawInRect:textrect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];
    }

    if (self.score2 == 10) {
        NSImage *text = [NSImage imageNamed:@"P2Win.png"];
        NSRect textrect = NSMakeRect(720 - 300, 50, 290, 50);
        [text drawInRect:textrect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];
    }

    int middle = 720 / 2;
    int one_fourth = middle / 2;

    NSRect P1Score = NSMakeRect(middle - one_fourth, 340, 50, 50);
    [[self.scores objectAtIndex:self.score1] drawInRect:P1Score fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];

    NSRect P2Score = NSMakeRect(middle + one_fourth - 50, 340, 50, 50);
    [[self.scores objectAtIndex:self.score2] drawInRect:P2Score fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];

    if (!self.paused) {
        if (self.score1 < 10 && self.score2 < 10) {
            [self update];
        }
    }
    if (self.enteringCmd) {
        @autoreleasepool {
            [[NSColor whiteColor] set];
            NSRectFill(NSMakeRect(0, 400 - 50, 720, 50));
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Monaco" size:18], NSFontAttributeName, [NSColor blackColor], NSForegroundColorAttributeName, nil];
            NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.cmdInput attributes:dict];
            [str drawAtPoint:NSMakePoint(10, 400 - 40)];
        }
    }
}

- (void) resetPlayers {
    [NSThread sleepForTimeInterval:0.5];
    [self.entity1 setY:400 / 2 - 50];
    [self.entity2 setY:400 / 2 - 50];
    [self.ball setY:400 / 2 - 15];
    [self.ball setX:720 / 2 - 15];
    [self.log log:@"Reset entity positions"];
}

- (void) keyUp:(NSEvent *)theEvent {
    if ([theEvent.characters isEqualToString:@"w"]) {
        [self setW:NO];
    }
    if ([theEvent.characters isEqualToString:@"s"]) {
        [self setS:NO];
    }
    if (theEvent.keyCode == 126) { //UP pressed
        [self setUP:NO];
    }
    if (theEvent.keyCode == 125) { //DOWN pressed
        [self setDOWN:NO];
    }
}

- (void) keyDown:(NSEvent *)theEvent {
    self.lastPressedKey = theEvent.characters;
    if (self.enteringCmd) {
        if (theEvent.keyCode == 36) {
            self.enteringCmd = NO;
            self.paused = NO;
            [self exec:self.cmdInput];
            self.cmdInput = [@"" mutableCopy];
        } else if (theEvent.keyCode == 51) {
            self.cmdInput = [[self.cmdInput substringToIndex:[self.cmdInput length] - 1] mutableCopy];
        } else {
            [self.cmdInput appendString:[theEvent characters]];
        }
    } else {
        if ([theEvent.characters isEqualToString:@"]"]) {
            self.paused = NO;
        } else if ([theEvent.characters isEqualToString:@"["]) {
            self.paused = YES;
        } else if ([theEvent.characters isEqualToString:@"\\"]) {
            self.debug = !self.debug;
        } else if ([theEvent.characters isEqualToString:@"p"]) {
            if (!self.cheats) {
                return;
            }
            self.paused = YES;
            self.enteringCmd = YES;
        } else if ([theEvent.characters isEqualToString:@"w"]) {
            [self setW:YES];
        } else if ([theEvent.characters isEqualToString:@"s"]) {
            [self setS:YES];
        } else if (theEvent.keyCode == 126) { //UP pressed
            [self setUP:YES];
        } else if (theEvent.keyCode == 125) { //DOWN pressed
            [self setDOWN:YES];
        } else if ([theEvent.characters isEqualToString:@";"]) {
            [self saveGame];
        } else if ([theEvent.characters isEqualToString:@"'"]) {
            [self loadGame];
        }
    }
}

- (void) update {
	[self.ball update:self];
    if (self.bUps > 1) {
        for(int i = 1; i < self.bUps; i++) {
            [self.ball update:self];
        }
    }
}

- (void) exec:(NSString *)str {
    if ([str isEqualToString:@""]) {
        return;
    }
    if ([str isEqual: @"fastball"]) {
        if (self.fastball) {
            self.bUps -= 10;
            self.fastball = NO;
        } else {
            self.bUps += 10;
            self.fastball = YES;
        }
    } else if ([str hasPrefix:@"rpSpeed "]) {
        str = [str substringFromIndex:[@"rpSpeed " length]];
        self.rpUps = [str floatValue];
    } else if ([str hasPrefix:@"lpSpeed "]) {
        str = [str substringFromIndex:[@"lpSpeed " length]];
        self.lpUps = [str floatValue];
    } else if ([str hasPrefix:@"bSpeed "]) {
        str = [str substringFromIndex:[@"bSpeed " length]];
        self.bUps = [str floatValue];
    } else if ([str isEqualToString:@"disco"]) {
        [self setDisco:!self.disco];
    } else if ([str hasPrefix:@"p1score "]) {
        str = [str substringFromIndex:[@"p1score " length]];
        self.score1 = [str floatValue];
    } else if ([str hasPrefix:@"p2score "]) {
        str = [str substringFromIndex:[@"p2score " length]];
        self.score2 = [str floatValue];
    } else if ([str hasPrefix:@"rcolor "] || [str hasPrefix:@"lcolor"] || [str hasPrefix:@"ncolor"] || [str hasPrefix:@"bcolor"]) {
        int change;
    	if ([str hasPrefix:@"rcolor"]) {
            change = 1;
        } else if ([str hasPrefix:@"lcolor"]) {
            change = 2;
        } else if ([str hasPrefix:@"ncolor"]) {
            change = 3;
        } else {
            change = 4;
        }
        NSInteger length = [@"rcolor " length];
		NSRange range;
        str = [str substringFromIndex:length]; //str is now @"%d %d %d"

        NSString *r = str; //r is @"%d %d %d"
		range = [r rangeOfString:@" "];
        NSInteger i = range.location;
        r = [r substringToIndex:i]; //r should be @"%d"
        float R = [r floatValue];

        str = [str substringFromIndex:range.location + 1]; //str should now be @"%d %d"

		NSString *g = str; //g should be @"%d %d"
		range = [g rangeOfString:@" "];
		NSInteger i1 = range.location;
		g = [g substringToIndex:i1]; //g should be @"%d"
		float G = [g floatValue];

		str = [str substringFromIndex:range.location + 1]; //str should now be @"%d"

		float B = [str floatValue];
        NSColor *newcolor = [NSColor colorWithCalibratedRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
        switch (change) {
            case 1:
                self.rcolor = newcolor;
                break;

            case 2:
                self.lcolor = newcolor;
                break;

            case 3:
                self.netcolor = newcolor;
                break;

            case 4:
                self.bcolor = newcolor;

            default:
                break;
        }
    } else if ([str isEqualToString:@"hollow"]) {
        self.hollow = !self.hollow;
    } else if ([str isEqualToString:@"help"]) {
        [self.cmds setIsVisible:YES];
        self.paused = YES;
    } else if ([str hasPrefix:@"dirChange"]) {
        str = [str substringFromIndex:[@"dirChange " length]];
        [self.ball setDirChange:[str floatValue]];
    } else if ([str isEqualToString:@"resetball"]) {
        self.ball.moving = NO;
    } else if ([str isEqualToString:@"xbounce"]) {
        self.ball.xmove *= -1;
    } else if ([str isEqualToString:@"ybounce"]) {
        self.ball.ymove *= -1;
    } else if ([str isEqualToString:@"resetDir"]) {
        [self.ball generateXDirection];
        [self.ball generateYDirection];
    } else if ([str hasPrefix:@"sound1 "] || [str hasPrefix:@"sound2"] || [str hasPrefix:@"sound3"]) {
        NSString *str1 = [[str substringFromIndex:@"sound- ".length] lowercaseString];
        if ([str1 isEqualToString:@"pop"] || [str1 isEqualToString:@"ping"] || [str1 isEqualToString:@"glass"]) {
            NSString* pt1 = [NSString stringWithFormat:@"%c", [str1 characterAtIndex:0]];
            str1 = [str1 substringFromIndex:1];
            pt1 = [pt1 uppercaseString];
            str1 = [NSString stringWithFormat:@"%@%@", pt1, str1];
            if ([str hasPrefix:@"sound1"]) {
                self.sound1 = str1;
            } else if ([str hasPrefix:@"sound2"]) {
                self.sound2 = str1;
            } else if ([str hasPrefix:@"sound3"]) {
                self.sound3 = str1;
            }
        }
    }
}

- (void) saveGame {
    @autoreleasepool {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:@[@(self.entity1.x),@(self.entity1.y),@(self.entity1.side)] forKey:@"P1"];

        [dict setObject:@[@(self.entity2.x),@(self.entity2.y),@(self.entity2.side)] forKey:@"P2"];

        [dict setObject:@[@(self.ball.x),@(self.ball.y),@(self.ball.dirChange),@(self.ball.xmove),@(self.ball.ymove)] forKey:@"Ball"];

        [dict setObject:[NSNumber numberWithInt:self.score1] forKey:@"Score1"];
        [dict setObject:[NSNumber numberWithInt:self.score2] forKey:@"Score2"];

        [dict setObject:[NSNumber numberWithInt:self.lpUps] forKey:@"Speed1"];
        [dict setObject:[NSNumber numberWithInt:self.rpUps] forKey:@"Speed2"];
        [dict setObject:[NSNumber numberWithInt:self.bUps] forKey:@"SpeedB"];

        CGFloat r, g, b;

        [[self.lcolor colorUsingColorSpaceName:NSCalibratedRGBColorSpace] getRed:&r green:&g blue:&b alpha:NULL];
        [dict setObject:@[@(r),@(g),@(b)] forKey:@"Color1"];

        [[self.rcolor colorUsingColorSpaceName:NSCalibratedRGBColorSpace] getRed:&r green:&g blue:&b alpha:NULL];
        [dict setObject:@[@(r),@(g),@(b)] forKey:@"Color2"];

        [[self.bcolor colorUsingColorSpaceName:NSCalibratedRGBColorSpace] getRed:&r green:&g blue:&b alpha:NULL];
        [dict setObject:@[@(r),@(g),@(b)] forKey:@"ColorB"];

        [[self.netcolor colorUsingColorSpaceName:NSCalibratedRGBColorSpace] getRed:&r green:&g blue:&b alpha:NULL];
        [dict setObject:@[@(r),@(g),@(b)] forKey:@"ColorN"];

        if (self.bgcolor) {
            [[self.bgcolor colorUsingColorSpaceName:NSCalibratedRGBColorSpace] getRed:&r green:&g blue:&b alpha:NULL];
            [dict setObject:@[@(r),@(g),@(b)] forKey:@"ColorBG"];
        } else {
            [dict setObject:@[ @0 , @0 , @0 ] forKey:@"ColorBG"];
        }
        NSSavePanel *panel = [[NSSavePanel alloc] init];
        NSInteger clicked = [panel runModal];
        if (clicked == NSFileHandlingPanelOKButton) {
            NSURL *url = [panel URL];
            [dict writeToURL:url atomically:YES];
            if (self.imageBG) {
                [[NSAlert alertWithMessageText:@"Notice" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@"BG image not saved"] runModal];
            }
        }
    }
}

- (void) loadGame {
    @autoreleasepool {
        NSOpenPanel *panel = [[NSOpenPanel alloc] init];
        [panel setAllowsMultipleSelection:NO];
        NSInteger clicked = [panel runModal];
        if (clicked == NSFileHandlingPanelOKButton) {
            NSURL *url = [panel URL];
            NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:url];
            NSArray *array;

            array = [dict objectForKey:@"P1"];
            [self.entity1 setX:[[array objectAtIndex:0] intValue]];
            [self.entity1 setY:[[array objectAtIndex:1] intValue]];

            array = [dict objectForKey:@"P2"];
            [self.entity2 setX:[[array objectAtIndex:0] intValue]];
            [self.entity2 setY:[[array objectAtIndex:1] intValue]];

            array = [dict objectForKey:@"Ball"];
            [self.ball setX:[[array objectAtIndex:0] intValue]];
            [self.ball setY:[[array objectAtIndex:1] intValue]];
            [self.ball setDirChange:[[array objectAtIndex:2] floatValue]];
            [self.ball setXmove:[[array objectAtIndex:3] intValue]];
            [self.ball setYmove:[[array objectAtIndex:4] intValue]];

            self.score1 = [[dict objectForKey:@"Score1"] intValue];
            self.score2 = [[dict objectForKey:@"Score2"] intValue];
            self.lpUps = [[dict objectForKey:@"Speed1"] intValue];
            self.rpUps = [[dict objectForKey:@"Speed2"] intValue];
            self.bUps = [[dict objectForKey:@"SpeedB"] intValue];

            CGFloat r, g, b;

            array = [dict objectForKey:@"Color1"];
            r = [[array objectAtIndex:0] floatValue];
            g = [[array objectAtIndex:1] floatValue];
            b = [[array objectAtIndex:2] floatValue];
            self.lcolor = [NSColor colorWithCalibratedRed:r green:g blue:b alpha:1.0f];

            array = [dict objectForKey:@"Color2"];
            r = [[array objectAtIndex:0] floatValue];
            g = [[array objectAtIndex:1] floatValue];
            b = [[array objectAtIndex:2] floatValue];
            self.rcolor = [NSColor colorWithCalibratedRed:r green:g blue:b alpha:1.0f];

            array = [dict objectForKey:@"ColorB"];
            r = [[array objectAtIndex:0] floatValue];
            g = [[array objectAtIndex:1] floatValue];
            b = [[array objectAtIndex:2] floatValue];
            self.bcolor = [NSColor colorWithCalibratedRed:r green:g blue:b alpha:1.0f];

            array = [dict objectForKey:@"ColorN"];
            r = [[array objectAtIndex:0] floatValue];
            g = [[array objectAtIndex:1] floatValue];
            b = [[array objectAtIndex:2] floatValue];
            self.netcolor = [NSColor colorWithCalibratedRed:r green:g blue:b alpha:1.0f];

            array = [dict objectForKey:@"ColorBG"];
            r = [[array objectAtIndex:0] floatValue];
            g = [[array objectAtIndex:1] floatValue];
            b = [[array objectAtIndex:2] floatValue];
            self.bgcolor = [NSColor colorWithCalibratedRed:r green:g blue:b alpha:1.0f];

            self.paused = YES;
        }
    }
}

@end
