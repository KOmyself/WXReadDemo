//
//  WXBookListViewController.h
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/18.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WXBookListViewControllerDelegate <NSObject>

- (void)selectBookIndex:(NSInteger)bookIndex;

@end

@interface WXBookListViewController : UIViewController

@property(nonatomic,weak)id<WXBookListViewControllerDelegate> delegate;

@end
