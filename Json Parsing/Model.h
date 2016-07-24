//
//  Model.h
//  Json Parsing
//
//  Created by Apple on 19/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (strong, nonatomic) NSString *evename;
@property (strong, nonatomic) NSString *eveid;
@property (strong, nonatomic) NSString *evedesc;
@property (strong, nonatomic) NSString *evemaxteamsize;
@property (strong, nonatomic) NSString *cveid;
@property (strong, nonatomic) NSString *cvename;
@property (strong, nonatomic) NSString *cventcvetname;
@property (strong, nonatomic) NSString *cventcvetno;

-(id)initWithDict:(NSDictionary*)dict;
@end
