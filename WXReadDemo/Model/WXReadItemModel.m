//
//  WXReadItemModel.m
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/18.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import "WXReadItemModel.h"

@implementation WXReadItemModel

- (instancetype)initWithStr:(NSString *)txtStr
{
    self = [super init];
    if (self) {
        
        if ([txtStr hasPrefix:@"【"] || [txtStr hasSuffix:@"】"]) {
            
            self.name = @"";
            self.content = txtStr;
            
        }else{
            
            NSRange range = [txtStr rangeOfString:@"："];
            
            if (range.location != NSNotFound) {
                
                NSString *name = [txtStr substringToIndex:range.location];
                
                NSString *content = [txtStr substringFromIndex:range.location + range.length];
                
                self.name = name;
                
                self.content = content;
            }else{
                
                self.name = @"";
                self.content = txtStr;
            }
        }
    }
    return self;
}

@end
