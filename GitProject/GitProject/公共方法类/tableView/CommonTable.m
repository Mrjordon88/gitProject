//
//  CommonTable.m
//  GitProject
//
//  Created by Apple on 2020/11/13.
//

#import "CommonTable.h"

@implementation CommonTable

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =UIColorFromRGB(0xF5F5F5);
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

@end
