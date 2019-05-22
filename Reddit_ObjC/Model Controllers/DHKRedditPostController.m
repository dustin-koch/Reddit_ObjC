//
//  DHKRedditPostController.m
//  Reddit_ObjC
//
//  Created by Dustin Koch on 5/22/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import "DHKRedditPostController.h"
#import "DHKRedditPost.h"

static NSString * const baseURLString = @"http://www.reddit.com/.json";

@implementation DHKRedditPostController

//Singleton
+ (instancetype)shared
{
    static DHKRedditPostController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [DHKRedditPostController new];
    });
    return shared;
}

//CRUD functions
- (void)fetchPosts:(void (^)(BOOL))completion
{
    //Create URL
    NSURL *url = [[NSURL alloc] initWithString:baseURLString];
    //Data task and completion
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"%@", error.localizedDescription);
            completion(false);
            return;
        }
        if (!data)  {
            NSLog(@"Data is missing");
            completion(false);
            return;
        }
        
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary *dataDictionary = topLevelJSON[@"data"];
        NSArray<NSDictionary *> *childrenArray = dataDictionary[@"children"];
        
        NSMutableArray<DHKRedditPost *> *arrayOfPosts = [NSMutableArray new];
        
        for (NSDictionary *currentDictionary in childrenArray) {
            DHKRedditPost *post = [[DHKRedditPost alloc] initWithDictionary:currentDictionary];
            [arrayOfPosts addObject:post];
        }
        DHKRedditPostController.shared.posts = arrayOfPosts;
        completion(true);
    }] resume];

}

- (void)fetchImageForPost:(DHKRedditPost *)post completion:(void (^)(UIImage * _Nullable))completion
{
    
}

@end
