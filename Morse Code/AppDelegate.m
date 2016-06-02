//
//  AppDelegate.m
//  Morse Code
//
//  Created by Jordan Kiley on 6/2/16.
//  Copyright © 2016 Jordan Kiley. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSString *stringToBeMorseCoded = @"Hello, how are you today?";
    NSString *morseCodedString = [ self translateStringToMorseCode:stringToBeMorseCoded ];
    
    NSString *codedString = [ morseCodedString copy ] ;
    NSString *decodeString = [ self translateMorseCodeToString:codedString ];
    
    NSLog(@"%@", decodeString);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (NSString *)translateStringToMorseCode:(NSString *)stringToTranslate {
    
    NSString *stringToMorseCode = [ [stringToTranslate copy] lowercaseString ];
    NSMutableString *morseCodeString = [ NSMutableString new ];
    NSDictionary *morseCodeAlphabet = @{
                                        @" " : @"| ",
                                        @"a" : @"*- ",
                                        @"b" : @"-* ",
                                        @"c" : @"-*-* ",
                                        @"d" : @"-** ",
                                        @"f" : @"**-* ",
                                        @"g" : @"--* ",
                                        @"h" : @"**** ",
                                        @"i" : @"** ",
                                        @"j" : @"*--- ",
                                        @"k" : @"-*- ",
                                        @"l" : @"*-** ",
                                        @"m" : @"-- ",
                                        @"n" : @"-* ",
                                        @"o" : @"--- ",
                                        @"p" : @"*--* ",
                                        @"q" : @"--*- ",
                                        @"r" : @"*-* ",
                                        @"s" : @"*** ",
                                        @"t" : @"- ",
                                        @"u" : @"**- ",
                                        @"v" : @"***- ",
                                        @"w" : @"*-- ",
                                        @"x" : @"-**- " ,
                                        @"y" : @"-*-- ",
                                        @"z" : @"--** ",
                                        @"0" : @"----- ",
                                        @"1" : @"*---- ",
                                        @"2" : @"**--- ",
                                        @"3" : @"***-- ",
                                        @"4" : @"****- ",
                                        @"5" : @"***** ",
                                        @"6" : @"-**** ",
                                        @"7" : @"--*** ",
                                        @"8" : @"---** ",
                                        @"9" : @"----* ",
                                        @"." : @"*-*-*- ",
                                        @"," : @"--**-- ",
                                        @"?" : @"**--** ",
                                        @"'" : @"*----* ",
                                        @"!" : @"-*-*-- ",
                                        @"\"" : @"*-**-* ",
                                        @"e" : @"* "
                                        } ;
    //    for (NSString *key in morseCodeAlphabet ) {
    //        morseCodeString = [ morseCodeString stringByReplacingOccurrencesOfString:key withString:morseCodeAlphabet[key] ] ;
    //    }
    // Sorted Array of keys, iterate over that? - Works!
    //    NSArray *arrayOfDictKeys = [ morseCodeAlphabet allKeys ] ;
    //    NSSortDescriptor *sortDictionary = [ NSSortDescriptor sortDescriptorWithKey:nil ascending:YES ] ;
    //    NSArray *sortedArray = [ arrayOfDictKeys sortedArrayUsingDescriptors:@[sortDictionary ]] ;
    //    NSLog(@"%@", sortedArray );
    //Iterate over characters ? MutableString returning null
    for ( NSUInteger i = 0 ; i < [ stringToMorseCode length ] ; i++ ) {
        char *ch = [ stringToMorseCode characterAtIndex:i ] ;
        NSString *alpha = [ NSString stringWithFormat:@"%c", ch ] ;
        for ( NSString *key in morseCodeAlphabet ) {
            if ( [ key isEqualToString:alpha ] ) {
                [ morseCodeString appendString:morseCodeAlphabet[key] ] ;
            }
        }
    }
    NSLog(@"%@", morseCodeString );
    return morseCodeString ;
}


- (NSString *)translateMorseCodeToString:(NSString *)stringInMorseCode {
    
    NSArray *codedArray = [ stringInMorseCode componentsSeparatedByString:@" " ];
    NSMutableArray *decodedArray = [ NSMutableArray new ] ;
    NSDictionary *morseCodeAlphabet = @{
                                        @" " : @"|",
                                        @"a" : @"*-",
                                        @"b" : @"-*",
                                        @"c" : @"-*-*",
                                        @"d" : @"-**",
                                        
                                        @"f" : @"**-*",
                                        @"g" : @"--*",
                                        @"h" : @"****",
                                        @"i" : @"**",
                                        @"j" : @"*---",
                                        @"k" : @"-*-",
                                        @"l" : @"*-**",
                                        @"m" : @"--",
                                        @"n" : @"-*",
                                        @"o" : @"---",
                                        @"p" : @"*--*",
                                        @"q" : @"--*-",
                                        @"r" : @"*-*",
                                        @"s" : @"***",
                                        @"t" : @"-",
                                        @"u" : @"**-",
                                        @"v" : @"***-",
                                        @"w" : @"*--",
                                        @"x" : @"-**-" ,
                                        @"y" : @"-*--",
                                        @"z" : @"--**",
                                        @"0" : @"-----",
                                        @"1" : @"*----",
                                        @"2" : @"**---",
                                        @"3" : @"***--",
                                        @"4" : @"****-",
                                        @"5" : @"*****",
                                        @"6" : @"-****",
                                        @"7" : @"--***",
                                        @"8" : @"---**",
                                        @"9" : @"----*",
                                        @"." : @"*-*-*-",
                                        @"," : @"--**--",
                                        @"?" : @"**--**",
                                        @"'" : @"*----*",
                                        @"!" : @"-*-*--",
                                        @"\"" : @"*-**-*",
                                        @"e" : @"*"
                                        } ;
    for ( NSUInteger i = 0 ; i < [ codedArray count ] ; i++) {
        ;
        for (NSString *key in morseCodeAlphabet ) {
            if ( [ morseCodeAlphabet[key] isEqualToString:codedArray[i] ] ) {
                [ decodedArray addObject:key ] ;
            }
        }
    }
    decodedArray[0] = [ decodedArray[0] capitalizedString ] ;
    NSMutableString *codelessString = [ decodedArray componentsJoinedByString:@"" ];
    
    NSLog(@"%@", codelessString) ;
    return codelessString;
}


@end
