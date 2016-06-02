//
//  AppDelegate.h
//  Morse Code
//
//  Created by Jordan Kiley on 6/2/16.
//  Copyright © 2016 Jordan Kiley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

- (NSString *)translateStringToMorseCode:(NSString *)stringToTranslate ;

- (NSString *)translateMorseCodeToString:(NSString *)stringInMorseCode ;


@end

