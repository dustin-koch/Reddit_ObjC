//
//  DHKRedditPost.h
//  Reddit_ObjC
//
//  Created by Dustin Koch on 5/22/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHKRedditPost : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy, nullable) NSString *thumbnail;

- (instancetype) initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail;

@end

@interface DHKRedditPost (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
