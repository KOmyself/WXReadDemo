//
//  WXBookModel.h
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/18.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXBookModel : NSObject

@property(nonatomic,copy)NSString   *bookName;
@property(nonatomic,copy)NSString   *bookPath;

@property(nonatomic,copy)NSDictionary *nameColorDict;
@property(nonatomic,copy)NSDictionary *headerDict;

@end
