//
//  main.m
//  Stringz
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSMutableString *str = [[NSMutableString alloc] init];
//        for (int i=0; i < 10; i++) {
//            [str appendString:@"Aaron is cool!\n"];
//        }
//        
//        // Declare a pointer to an  NSError object, but don't instantiate it
//        // The NSError instance will only be created if there is, in fact, an error.
//        NSError *error;
//        
//        // Pass the NSError pointer by reference to the NSString method
//        BOOL success = [str writeToFile:@"/tmp/cool.txt"
//                             atomically:YES
//                               encoding:NSUTF8StringEncoding
//                                  error:&error];
//        
//        // Test the return BOOL, and query the NSError if the write failed
//        if (success) {
//            NSLog(@"done writing /tmp/cool.txt");
//        }
//        else {
//            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
//        }
        
//        NSError *error;
//        NSString *str = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
//                                                               encoding:NSASCIIStringEncoding
//                                                                  error:&error];
//        if (!str) {
//            NSLog(@"read failed: %@", [error localizedDescription]);
//        } else {
//            NSLog(@"resolve.conf looks like this: %@", str);
//        }
        
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
        if (!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        BOOL written = [data writeToFile:@"/tmp/google.png" options:NSDataWritingAtomic error:&error];
        
        if (!written) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
		NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
    }
    return 0;
}

