//
//  JsonDataTableViewCell.m
//  Json Parsing
//
//  Created by Apple on 20/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "JsonDataTableViewCell.h"

@implementation JsonDataTableViewCell
@synthesize nameLabel = _nameLabel;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
