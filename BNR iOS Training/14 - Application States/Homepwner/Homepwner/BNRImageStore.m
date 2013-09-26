//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Matthew D. Mathias on 6/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;
- (NSString *)imagePathForKey:(NSString *)key;

@end

@implementation BNRImageStore

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}

+ (BNRImageStore *)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore) {
        // Create the singleton
        sharedStore = [[super allocWithZone:NULL] init];
    }
    return sharedStore;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.dictionary = [[NSMutableDictionary alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)clearCache:(NSNotification *)note {
    NSLog(@"flushing %d images out of the cache", [self.dictionary count]);
    [self.dictionary removeAllObjects];
}

- (void)setImage:(UIImage *)i forKey:(NSString *)s
{
    self.dictionary[s] = i;
    
    // Create full path for image
    NSString *imagePath = [self imagePathForKey:s];
    
    // Turn image into JPEG data,
    NSData *d = UIImageJPEGRepresentation(i, 0.5);
    
    // Write it to full path
    [d writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)s
{
//    return self.dictionary[s];
    // If possible, get it from the dictionary
    UIImage *result = self.dictionary[s];
    
    if (!result) {
        // Create UIImage object from file
        result = [UIImage imageWithContentsOfFile:[self imagePathForKey:s]];
        
        // If we found an image on the file system, place it into the cache
        if (result)
            self.dictionary[s] = result;
        else
            NSLog(@"Error: unable to find %@", [self imagePathForKey:s]);
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)s
{
    if (!s)
        return;
    [self.dictionary removeObjectForKey:s];
}

- (NSString *)imagePathForKey:(NSString *)key {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}
@end
