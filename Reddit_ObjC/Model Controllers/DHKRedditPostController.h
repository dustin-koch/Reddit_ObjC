//
//  DHKRedditPostController.h
//  Reddit_ObjC
//
//  Created by Dustin Koch on 5/22/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHKRedditPost;

NS_ASSUME_NONNULL_BEGIN

@interface DHKRedditPostController : NSObject

//Source of truth
@property (nonatomic, copy) NSArray<DHKRedditPost *> *posts;

//Singleton
+ (instancetype) shared;

//CRUD Functions
- (void) fetchPosts:(void (^)(BOOL)) completion;
- (void) fetchImageForPost:(DHKRedditPost *)post completion:(void (^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
