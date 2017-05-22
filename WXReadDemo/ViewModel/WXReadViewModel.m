//
//  WXReadViewModel.m
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/17.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import "WXReadViewModel.h"

@implementation WXReadViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _bookArray = [[NSMutableArray alloc] init];
        [self initBookListData];
        
        _contentArray = [[NSMutableArray alloc] init];

        _readArray    = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)initBookListData
{
    WXBookModel *bookModel = [[WXBookModel alloc] init];
    bookModel.bookName = @"第十二夜剧本";
    bookModel.bookPath = [[NSBundle mainBundle] pathForResource:@"第十二夜剧本" ofType:@"txt"];
    bookModel.headerDict = @{@"奥丽维亚":@"header_alwy",
                             @"奥利维亚":@"header_alwy",
                    @"船长":@"header_cz",
                    @"公爵":@"header_gj",
                    @"马伏里奥":@"header_mfla",
                    @"托比":@"header_tb",
                    @"薇奥拉":@"header_wal",
                    @"西巴斯辛":@"header_xbsx",
                    @"安德鲁":@"header_gj"};
    
    bookModel.nameColorDict = @{@"奥丽维亚":@"#FF00FF",
                                @"奥利维亚":@"#FF00FF",
                       @"船长":@"#3CB371",
                       @"公爵":@"#DC143C",
                       @"马伏里奥":@"#1E90FF",
                       @"托比":@"#FF4500",
                       @"薇奥拉":@"#D2691E",
                       @"西巴斯辛":@"#FF8C00",
                       @"安德鲁":@"#DC143C"};
    [_bookArray addObject:bookModel];
    
    WXBookModel *bookModel2 = [[WXBookModel alloc] init];
    bookModel2.bookName = @"人质";
    bookModel2.bookPath = [[NSBundle mainBundle] pathForResource:@"人质" ofType:@"txt"];
    bookModel2.headerDict = @{@"抢劫者":@"header_cz",
                             @"自杀者":@"header_gj",
                              @"警察":@"header_mfla"};
    
    bookModel2.nameColorDict = @{@"抢劫者":@"#FF00FF",
                                @"自杀者":@"#3CB371",
                                 @"警察":@"#DC143C"};
    [_bookArray addObject:bookModel2];
    
    WXBookModel *bookModel3 = [[WXBookModel alloc] init];
    bookModel3.bookName = @"爱情公寓第六集(上) ";
    bookModel3.bookPath = [[NSBundle mainBundle] pathForResource:@"爱情公寓第六集(上)" ofType:@"txt"];
    bookModel3.headerDict = @{@"吕子乔":@"header_alwy",
                             @"张伟":@"header_gj",
                             @"曾小贤":@"header_cz",
                             @"关谷":@"header_gj",
                             @"秦羽墨":@"header_mfla",
                             @"胡一菲":@"header_tb",
                             @"李察德":@"header_wal",
                             @"唐悠悠":@"header_xbsx",
                             @"Joy":@"header_cz",
                             @"Tina":@"header_mfla",
                             @"班尼":@"header_tb"};
    
    bookModel3.nameColorDict = @{@"吕子乔":@"#FF00FF",
                                @"张伟":@"#DC143C",
                                @"曾小贤":@"#3CB371",
                                @"关谷":@"#DC143C",
                                @"秦羽墨":@"#1E90FF",
                                @"胡一菲":@"#FF4500",
                                @"李察德":@"#D2691E",
                                @"唐悠悠":@"#FF8C00",
                                @"Joy":@"#3CB371",
                                @"Tina":@"#1E90FF",
                                @"班尼":@"#FF4500"};
    [_bookArray addObject:bookModel3];
    
    WXBookModel *bookModel4 = [[WXBookModel alloc] init];
    bookModel4.bookName = @"爱情公寓第六集(下) ";
    bookModel4.bookPath = [[NSBundle mainBundle] pathForResource:@"爱情公寓第六集(下)" ofType:@"txt"];
    bookModel4.headerDict = @{@"吕子乔":@"header_alwy",
                              @"张伟":@"header_gj",
                              @"曾小贤":@"header_cz",
                              @"关谷":@"header_gj",
                              @"秦羽墨":@"header_mfla",
                              @"胡一菲":@"header_tb",
                              @"李察德":@"header_wal",
                              @"唐悠悠":@"header_xbsx",
                              @"Joy":@"header_cz",
                              @"Tina":@"header_mfla",
                              @"班尼":@"header_tb"};
    
    bookModel4.nameColorDict = @{@"吕子乔":@"#FF00FF",
                                 @"张伟":@"#DC143C",
                                 @"曾小贤":@"#3CB371",
                                 @"关谷":@"#DC143C",
                                 @"秦羽墨":@"#1E90FF",
                                 @"胡一菲":@"#FF4500",
                                 @"李察德":@"#D2691E",
                                 @"唐悠悠":@"#FF8C00",
                                 @"Joy":@"#3CB371",
                                 @"Tina":@"#1E90FF",
                                 @"班尼":@"#FF4500"};
    [_bookArray addObject:bookModel4];
    
    
    WXBookModel *bookModel5 = [[WXBookModel alloc] init];
    bookModel5.bookName = @"哈姆雷特";
    bookModel5.bookPath = [[NSBundle mainBundle] pathForResource:@"哈姆雷特" ofType:@"txt"];
    bookModel5.headerDict = @{@"Guard 1":@"header_alwy",
                              @"Guard 2":@"header_gj",
                              @"Horatio":@"header_cz",
                              @"Claudius":@"header_gj",
                              @"Gertrude":@"header_mfla",
                              @"Hamlet":@"header_tb",
                              @"Horatio":@"header_wal",
                              @"Ghost":@"header_xbsx",
                              @"Ophelia":@"header_cz",
                              @"Polonius":@"header_mfla",
                              @"Rosencrantz":@"header_tb",
                              @"Guildenstern":@"header_alwy",
                              @"Player Queen":@"header_gj",
                              @"Player King":@"header_wal",
                              @"Laertes":@"header_xbsx"};
    
    bookModel5.nameColorDict = @{@"Guard 1":@"#FF00FF",
                                 @"Guard 2":@"#DC143C",
                                 @"Horatio":@"#3CB371",
                                 @"Claudius":@"#DC143C",
                                 @"Gertrude":@"#1E90FF",
                                 @"Hamlet":@"#FF4500",
                                 @"Horatio":@"#D2691E",
                                 @"Ghost":@"#FF8C00",
                                 @"Ophelia":@"#3CB371",
                                 @"Polonius":@"#1E90FF",
                                 @"Rosencrantz":@"#FF4500",
                                 @"Guildenstern":@"#FF00FF",
                                 @"Player Queen":@"#DC143C",
                                 @"Player King":@"#3CB371",
                                 @"Laertes":@"#DC143C"};
    [_bookArray addObject:bookModel5];
}

- (NSString *)readBookWithIndex:(NSInteger)bookIndex
{
    [_contentArray removeAllObjects];
    [_readArray removeAllObjects];
    
    WXBookModel *bookModel = _bookArray[bookIndex];
    self.curBookModel = bookModel;
    
    NSString *filePath = bookModel.bookPath;
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *content = [[NSString alloc] initWithContentsOfFile:filePath encoding:enc error:nil];
    
    content = [content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    content = [content stringByReplacingOccurrencesOfString:@"\r\n\r\n" withString:@"@@@"];
    content = [content stringByReplacingOccurrencesOfString:@"\r\n" withString:@"@@@"];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"@@@"]];
    
    for (NSString *txtStr in tempArr) {
        
        NSString *tempStr = [txtStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if (tempStr.length > 0) {
            
            WXReadItemModel *model = [[WXReadItemModel alloc] initWithStr:txtStr];
            model.nameColor = bookModel.nameColorDict[model.name];
            model.headerUrl = bookModel.headerDict[model.name];
            [_contentArray addObject:model];
        }
    }
    
    return bookModel.bookName;
}

@end
