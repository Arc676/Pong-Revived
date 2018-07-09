//
//  Logger.m
//  Pong Revived
//
//  Created by Alessandro Vinciguerra on 12/25/13.
//  Copyright (c) 2013 Alessandro Vinciguerra (Arc676). All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void) log:(NSString *)message{
    NSString *str = [self string];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:date];
    str = [str stringByAppendingFormat:@"\n%lu:%lu:%lu %@", [components hour], [components minute], [components second], message];
    [self setString:str];
    [self scrollRangeToVisible:NSMakeRange(self.string.length, 0)];
}

@end
