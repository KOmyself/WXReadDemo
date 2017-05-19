//
//  WXReadViewController.m
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/17.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import "WXReadViewController.h"
#import "WXReadTextCell.h"
#import "WXReadViewModel.h"
#import "WXBookListViewController.h"

static NSString  *kReadTextCellIdentifier = @"kReadTextCellIdentifier";

@interface WXReadViewController ()<UITableViewDelegate,UITableViewDataSource,WXBookListViewControllerDelegate>
{
    UITableView         *_myTableView;
    
    WXReadTextCell      *_commonCell;
    
    WXReadViewModel     *_readViewModel;
    
    UIButton            *_nextBtn;
    
    UIView              *_shareView;
}
@end

@implementation WXReadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXRGBCOLOR(0xE8E9E8);
    
    _readViewModel = [[WXReadViewModel alloc] init];
    
    NSString *bookName = [_readViewModel readBookWithIndex:0];
    self.navigationItem.title = bookName;
    
    [self createNav];
    [self createTableView];
    [self createShareView];
    
    [self continueRead];
}

- (void)createNav
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setImage:[UIImage imageNamed:@"book_list"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(toBookList) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)createTableView
{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SQFullScreenWidth, SQFullScreenHeight) style:UITableViewStyleGrouped];
    _myTableView.backgroundColor = [UIColor clearColor];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerClass:[WXReadTextCell class] forCellReuseIdentifier:kReadTextCellIdentifier];
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kWhiteCell"];
    _commonCell = [_myTableView dequeueReusableCellWithIdentifier:kReadTextCellIdentifier];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SQFullScreenWidth, SQFullScreenHeight * 0.1)];
    footerView.backgroundColor = [UIColor clearColor];
    _myTableView.tableFooterView = footerView;
    
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextBtn.frame = CGRectMake(10, SQFullScreenHeight - 50, SQFullScreenWidth - 20, 45);
    [_nextBtn setTitleColor:HEXRGBCOLOR(0xFFFFFF) forState:UIControlStateNormal];
    [_nextBtn setTitle:@"NEXT" forState:UIControlStateNormal];
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_n"] forState:UIControlStateNormal];
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_p"] forState:UIControlStateHighlighted];
    [_nextBtn addTarget:self action:@selector(continueRead) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextBtn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(continueRead)];
    [_myTableView addGestureRecognizer:tap];
}

- (void)createShareView
{
    _shareView = [[UIView alloc] initWithFrame:CGRectMake(0, SQFullScreenHeight - 100, SQFullScreenWidth, 100)];
    _shareView.backgroundColor = [UIColor whiteColor];
    _shareView.hidden = YES;
    [self.view addSubview:_shareView];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SQFullScreenWidth, 20)];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.font = [UIFont systemFontOfSize:17.0];
    titleLbl.textColor = HEXRGBCOLOR(0x000000);
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.text = @"已读完，分享至";
    [_shareView addSubview:titleLbl];
    
    NSInteger margin = (SQFullScreenWidth - 50 * 3)/4.0;
    
    NSArray *imgArr = @[@"timeline",@"qqzone",@"weibo"];
    
    for (int i = 0; i < imgArr.count; ++i) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((i + 1) * margin + 50 * i, 40, 50, 50);
        [btn setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 50 / 2.0;
        btn.layer.masksToBounds = YES;
        [_shareView addSubview:btn];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == _readViewModel.readArray.count) {
        
        return SQFullScreenHeight * 0.35;
        
    }else{
        
        WXReadItemModel *txtModel = _readViewModel.readArray[indexPath.section];
        [_commonCell updateCellByModel:txtModel];
        
        return [_commonCell getCellHeight];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _readViewModel.readArray.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == _readViewModel.readArray.count) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kWhiteCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else{
        
        WXReadTextCell *cell = [tableView dequeueReusableCellWithIdentifier:kReadTextCellIdentifier forIndexPath:indexPath];
        
        WXReadItemModel *txtModel = _readViewModel.readArray[indexPath.section];
        [cell updateCellByModel:txtModel];
        
        return cell;
    }
}

#pragma mark - 方法

- (void)continueRead
{
    if (_readViewModel.readArray.count >= _readViewModel.contentArray.count) {
        
        _nextBtn.hidden = YES;
        _shareView.hidden = NO;
        
        return;
    }
    
    NSInteger nextIndex = 0;
    
    NSInteger readCount = _readViewModel.readArray.count;
    
    if (readCount != 0) {
        
        nextIndex = readCount++;
    }
    
    WXReadItemModel *nextTxtModel = _readViewModel.contentArray[nextIndex];
    [_readViewModel.readArray addObject:nextTxtModel];
    
    [_myTableView beginUpdates];
    [_myTableView insertSections:[NSIndexSet indexSetWithIndex:nextIndex] withRowAnimation:UITableViewRowAnimationFade];
    [_myTableView endUpdates];
    
    [self scrollViewToBottom:YES];
}

- (void)scrollViewToBottom:(BOOL)animated
{
    if (_myTableView.contentSize.height > _myTableView.bounds.size.height)
    {
        [_myTableView setContentOffset:CGPointMake(0, _myTableView.contentSize.height - _myTableView.bounds.size.height) animated:animated];
    }
}

- (void)toBookList
{
    WXBookListViewController *vc = [[WXBookListViewController alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - WXBookListViewControllerDelegate

- (void)selectBookIndex:(NSInteger)bookIndex
{
    _nextBtn.hidden = NO;
    _shareView.hidden = YES;
    
    NSString *bookName = [_readViewModel readBookWithIndex:bookIndex];
    self.navigationItem.title = bookName;
    
    [_myTableView reloadData];
    [self continueRead];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
