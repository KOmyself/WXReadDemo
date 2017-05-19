//
//  WXBookListViewController.m
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/18.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import "WXBookListViewController.h"
#import "WXReadViewModel.h"

static NSString  *kBookListCellIdentifier = @"kBookListCellIdentifier";

@interface WXBookListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView         *_myTableView;
    
    WXReadViewModel     *_readViewModel;
}
@end

@implementation WXBookListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"书籍";
    
    self.view.backgroundColor = HEXRGBCOLOR(0xE8E9E8);
    
    _readViewModel = [[WXReadViewModel alloc] init];
    
    [self createTableView];
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)createTableView
{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SQFullScreenWidth, SQFullScreenHeight) style:UITableViewStylePlain];
    _myTableView.backgroundColor = [UIColor clearColor];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.separatorColor = HEXRGBCOLOR(0xe8e8e9);
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kBookListCellIdentifier];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SQFullScreenWidth, 20)];
    footerView.backgroundColor = [UIColor clearColor];
    _myTableView.tableFooterView = footerView;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _readViewModel.bookArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBookListCellIdentifier forIndexPath:indexPath];
    
    WXBookModel *bookModel = _readViewModel.bookArray[indexPath.row];
    cell.textLabel.text = bookModel.bookName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectBookIndex:)]) {
        
        [self.delegate selectBookIndex:indexPath.row];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
