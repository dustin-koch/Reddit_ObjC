//
//  DHKRedditPost.m
//  Reddit_ObjC
//
//  Created by Dustin Koch on 5/22/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import "DHKRedditPost.h"

@implementation DHKRedditPost

- (instancetype)initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail
{
    self = [super init];
    if (self) {
        _title = title;
        _thumbnail = thumbnail;
    }
    return self;
}

@end

@implementation DHKRedditPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSDictionary *data = dictionary[@"data"];
    NSString *title = data[@"title"];
    NSString *thumbnail = data[@"thumbnail"];
    
    return [self initWithTitle:title thumbnail:thumbnail];
}

@end
