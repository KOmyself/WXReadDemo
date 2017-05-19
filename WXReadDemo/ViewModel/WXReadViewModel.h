//
//  WXReadViewModel.h
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/17.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXReadItemModel.h"
#import "WXBookModel.h"

@interface WXReadViewModel : NSObject

@property(nonatomic,strong)NSMutableArray  *bookArray;

@property(nonatomic,strong)NSMutableArray  *contentArray;

@property(nonatomic,strong)NSMutableArray  *readArray;

@property(nonatomic,strong)WXBookModel  *curBookModel;

- (NSString *)readBookWithIndex:(NSInteger)bookIndex;

@end
