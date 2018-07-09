//
//  SuperGame.h
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 1/10/16.
//  Copyright © 2016 Scripter Squad. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef TARGET_OS_IOS
#import <UIKit/UIKit.h>
#endif

#ifdef TARGET_OS_IOS
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