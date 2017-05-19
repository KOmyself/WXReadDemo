//
//  WXReadTextCell.h
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/17.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXReadItemModel.h"

@interface WXReadTextCell : UITableViewCell

- (void)updateCellByModel:(WXReadItemModel *)model;

- (CGFloat)getCellHeight;

@end
