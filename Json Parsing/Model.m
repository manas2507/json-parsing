//
//  Model.m
//  Json Parsing
//
//  Created by Apple on 19/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "Model.h"

@implementation Model
-(id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        self.evename = [dict objectForKey:@"evename"];
        self.eveid = [dict objectForKey:@"eveid"];
        self.evedesc = [dict objectForKey:@"evedesc"];
        self.evemaxteamsize = [dict objectForKey:@"evemaxteamsize"];
        self.cveid = [dict objectForKey:@"cveid"];
        self.cvename = [dict objectForKey:@"cvename"];
        self.cventcvetname = [dict objectForKey:@"cventcvetname"];
        self.cventcvetno = [dict objectForKey:@"cventcvetno"];
    }
    return self;
}


@end
