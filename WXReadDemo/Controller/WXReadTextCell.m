//
//  WXReadTextCell.m
//  WXReadDemo
//
//  Created by 王晓 on 2017/5/17.
//  Copyright © 2017年 wangxiao. All rights reserved.
//

#import "WXReadTextCell.h"

const static CGFloat kCellHeight    = 55;
const static CGFloat kHeaderImgWH   = 45;
const static CGFloat kCommonMarginH = 10;

@interface WXReadTextCell()
{
    
    UILabel     *_titleLbl;
    
    UIView      *_bgView;
    UIImageView *_headerImgView;
    UILabel     *_nameLbl;
    UIImageView *_contentBgView;
    UILabel     *_contentLbl;
    
    CGFloat     _cellHeight;
}

@end

@implementation WXReadTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self initCell];
    }
    return self;
}

- (void)initCell
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(kCommonMarginH, 0, _bgView.frame.size.width - kCommonMarginH * 2, 20)];
    _titleLbl.backgroundColor = HEXRGBACOLOR(0xD3D3D3, 0.6);
    _titleLbl.font = [UIFont systemFontOfSize:17.0];
    _titleLbl.textColor = HEXRGBCOLOR(0x000000);
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.text = @"";
    _titleLbl.numberOfLines = 0;
    _titleLbl.layer.cornerRadius = 2.0;
    _titleLbl.layer.masksToBounds = YES;
    [self.contentView addSubview:_titleLbl];
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(kCommonMarginH, 0, screenWidth - kCommonMarginH, kCellHeight)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_bgView];
    
    _headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kHeaderImgWH, kHeaderImgWH)];
    _headerImgView.backgroundColor = [UIColor clearColor];
    _headerImgView.layer.cornerRadius = kHeaderImgWH/2.0;
    _headerImgView.layer.masksToBounds = YES;
    _headerImgView.image = [UIImage imageNamed:@"my_photo"];
    [_bgView addSubview:_headerImgView];
    
    _nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(kHeaderImgWH + kCommonMarginH * 2, 0, _bgView.frame.size.width - kHeaderImgWH - kCommonMarginH * 2, 15)];
    _nameLbl.backgroundColor = [UIColor clearColor];
    _nameLbl.font = [UIFont systemFontOfSize:13.0];
    _nameLbl.textColor = HEXRGBCOLOR(0x999999);
    _nameLbl.text = @"";
    [_bgView addSubview:_nameLbl];
    
    _contentBgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _contentBgView.backgroundColor = [UIColor clearColor];
    _contentBgView.image = [UIImage imageNamed:@"chat_from_bg_normal"];
    [_bgView addSubview:_contentBgView];
    
    _contentLbl = [[UILabel alloc] initWithFrame:CGRectZero];
    _contentLbl.backgroundColor = [UIColor clearColor];
    _contentLbl.font = [UIFont systemFontOfSize:16.0];
    _contentLbl.textColor = [UIColor blackColor];
    _contentLbl.numberOfLines = 0;
    [_contentBgView addSubview:_contentLbl];
}

- (void)updateCellByModel:(WXReadItemModel *)model
{
    if ([model.content hasPrefix:@"【"] || [model.content hasSuffix:@"】"]) {
        
        _bgView.hidden = YES;
        _titleLbl.hidden = NO;
        
        CGSize size = [model.content boundingRectWithSize:CGSizeMake(SQFullScreenWidth - kCommonMarginH * 2, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
        
        if (size.height < 45) {
            
            size.height = 45;
        }
        
        _titleLbl.frame = CGRectMake(kCommonMarginH, 0, SQFullScreenWidth - kCommonMarginH * 2, size.height);
        _titleLbl.text = model.content;
        
        _cellHeight = CGRectGetMaxY(_titleLbl.frame);
        
    }else{
        
        _bgView.hidden = NO;
        _titleLbl.hidden = YES;
        
        _headerImgView.image = [UIImage imageNamed:model.headerUrl];
        
        _nameLbl.text = model.name;
        _nameLbl.textColor = [self colorWithHexString:model.nameColor];
        
        CGSize size = [model.content boundingRectWithSize:CGSizeMake(SQFullScreenWidth - kCommonMarginH * 6 - kHeaderImgWH, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
        if (size.height < 35) {
            
            size.height = 35;
        }
        
        _contentBgView.frame = CGRectMake(_headerImgView.frame.origin.x + kHeaderImgWH + kCommonMarginH, _nameLbl.frame.size.height + kCommonMarginH/2.0, size.width + kCommonMarginH * 3, size.height + 10);
        _contentBgView.image = [[UIImage imageNamed:@"chat_from_bg_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 5, 30) resizingMode:UIImageResizingModeStretch];
        
        _contentLbl.frame = CGRectMake(kCommonMarginH * 2, kCommonMarginH/2.0, size.width, size.height);
        _contentLbl.text = model.content;
        
        _cellHeight = CGRectGetMaxY(_contentBgView.frame);
        
        _bgView.frame = CGRectMake(kCommonMarginH, 0, SQFullScreenWidth - kCommonMarginH, _cellHeight);
    }
}

- (CGFloat)getCellHeight
{
    return _cellHeight < kCellHeight ? kCellHeight : _cellHeight;
}

- (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return HEXRGBCOLOR(0x999999);
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return HEXRGBCOLOR(0x999999);
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
