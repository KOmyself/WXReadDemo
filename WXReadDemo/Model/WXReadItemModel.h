//
//  WXReadItemModel.h
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/18.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXReadItemModel : NSObject

@property(nonatomic,copy)NSString    *name;
@property(nonatomic,copy)NSString    *nameColor;
@property(nonatomic,copy)NSString    *headerUrl;
@property(nonatomic,copy)NSString    *content;

- (instancetype)initWithStr:(NSString *)txtStr;

@end
