//
//  CommunitGoodsCell.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/7.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "CommunitGoodsCell.h"

@interface CommunitGoodsCell ()<UIScrollViewDelegate>{
    
    UIButton *_headBtn;
    UILabel *_userNameLabel;
    UILabel *_datatimeLabel;
    UIScrollView *_bgPicsScroll;
    UIPageControl *_pageCon;
    UILabel *_contentLabel;
    UIButton *_tagBtn;
    UIView *_collectView;
    UIView *_commentView;
}

@end

@implementation CommunitGoodsCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setDataModel:(CommunitItems *)dataModel{
    if (_dataModel != dataModel) {
        _dataModel = dataModel;
        
        [self setNeedsLayout];
    }
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    
    
    UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame = CGRectZero;
    [self.contentView addSubview:headBtn];
    _headBtn = headBtn;
    
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    userNameLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:userNameLabel];
    _userNameLabel = userNameLabel;
    
    UILabel *datatimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    datatimeLabel.font = [UIFont systemFontOfSize:10];
    datatimeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:datatimeLabel];
    _datatimeLabel = datatimeLabel;
    
    UIScrollView *bgPicsScroll = [[UIScrollView alloc] initWithFrame:CGRectZero];
    bgPicsScroll.showsHorizontalScrollIndicator = NO;
    bgPicsScroll.pagingEnabled = YES;
//    bgPicsScroll.backgroundColor = MQRandomColor;
    bgPicsScroll.delegate = self;
    [self.contentView addSubview:bgPicsScroll];
    _bgPicsScroll = bgPicsScroll;
    
    UIPageControl *pageCon = [[UIPageControl alloc] initWithFrame:CGRectZero];
    pageCon.pageIndicatorTintColor = [UIColor whiteColor];
    pageCon.currentPageIndicatorTintColor = [UIColor redColor];
    [self.contentView addSubview:pageCon];
    _pageCon = pageCon;
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.numberOfLines = 0;
    [self.contentView addSubview:contentLabel];
    _contentLabel = contentLabel;
    
    UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagBtn setTitle:@"标签" forState:UIControlStateNormal];
    [tagBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tagBtn setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:tagBtn];
    _tagBtn = tagBtn;
    
    UIView *collectView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:collectView];
    _collectView = collectView;
    
    UIView *commentView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:commentView];
    _commentView = commentView;
//    commentView.backgroundColor = [UIColor redColor];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
   
    
    CommunitComponent *model = self.dataModel.component;

    //头像
    //因为有 placeholder 所以不用加全判断
    _headBtn.frame = CGRectMake(10, 5, 30, 30);
    _headBtn.layer.cornerRadius = 15;
    _headBtn.clipsToBounds = YES;
    [_headBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.user.userAvatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"icon_head_portrait@2x.png"]];
    
    //用户名
    if (model.user.username) {
        _userNameLabel.text = model.user.username;
        CGSize textSize = [self clacTextSizeWithText:_userNameLabel.text withWidth:100 withFont:12];
        _userNameLabel.frame = CGRectMake(50, 5, textSize.width, 15);
    }else{
        _userNameLabel.text = @"佚名";
    }
    
    //时间
    if (model.user.datatime) {
        _datatimeLabel.text = model.user.datatime;
        CGSize textSize = [self clacTextSizeWithText:_datatimeLabel.text withWidth:100 withFont:10];
        _datatimeLabel.frame = CGRectMake(50, 20, textSize.width, 15);
        
        //关注按钮
        UIButton *focusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        focusBtn.frame = CGRectMake(kMainBoundsW - 70, 10, 60, 20);
        [focusBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        [focusBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        focusBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        focusBtn.layer.borderWidth = 1;
        focusBtn.layer.cornerRadius = 3;
        focusBtn.clipsToBounds = YES;
        [focusBtn setFont:[UIFont systemFontOfSize:13]];
        [self.contentView addSubview:focusBtn];
    }
    
    //中间大图片
    if (model.pics.count > 0) {
        
        _bgPicsScroll.frame = CGRectMake(0, 40, kMainBoundsW, kMainBoundsW);
        _bgPicsScroll.contentSize = CGSizeMake(kMainBoundsW * model.pics.count, 0);

        for (NSInteger i = 0; i < model.pics.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(kMainBoundsW * i, 0, kMainBoundsW, kMainBoundsW);
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.pics[i]] forState:UIControlStateNormal];
            [_bgPicsScroll addSubview:button];

        }
        
        //当图片大于等于2张的时候  显示pageControll
        if (model.pics.count > 1) {
            _pageCon.frame = CGRectMake(kMainBoundsW - 110, _bgPicsScroll.frame.size.height + 20, 100, 10);
            _pageCon.numberOfPages = _bgPicsScroll.contentSize.width/kMainBoundsW;
        }
        
    }
    
    //评论
    if (model.content) {
        
        CGSize textSize = [self clacTextSizeWithText:model.content withWidth:kMainBoundsW - 20 withFont:14];
        if (textSize.height >= 110) {
            _contentLabel.frame = CGRectMake(10, kMainBoundsW + 50, kMainBoundsW - 20, 110);
        }else{
            _contentLabel.frame = CGRectMake(10, kMainBoundsW + 50, kMainBoundsW - 20, textSize.height);
        }
//        _contentLabel.backgroundColor = [UIColor redColor];
        _contentLabel.text = model.content;

    }
    
    //标签
    if (model.tags.count > 0) {
        CGFloat curWidth = 0;
        _tagBtn.frame = CGRectMake(10, kMainBoundsW + 60 + _contentLabel.frame.size.height, 30, 10);
        for (NSInteger i = 0; i < model.tags.count; i++) {
            CommunitTags *tagsModel = model.tags[i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[NSString stringWithFormat:@"#%@",tagsModel.category] forState:UIControlStateNormal];
            CGSize textSize = [self clacTextSizeWithText:button.titleLabel.text withWidth:0 withFont:12];
            
            
            button.frame = CGRectMake(55 + curWidth, kMainBoundsW + 60 + _contentLabel.frame.size.height, textSize.width, 10);
            [button setFont:[UIFont systemFontOfSize:12]];
            curWidth = curWidth + textSize.width + 10;
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [self.contentView addSubview:button];
        }
    }
    
    //收藏
    if (model.users.count > 0) {
        _collectView.sd_layout
        .topSpaceToView(_tagBtn,10)
        .leftEqualToView(_contentLabel)
        .rightEqualToView(_contentLabel)
        .heightIs(30);
        
        if (model.users.count < 8) {
            for (NSInteger i = 0; i < model.users.count; i++) {
                CommunitUsers *usersModel = model.users[i];
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(40 * i, 0, 30, 30);
                button.layer.cornerRadius = 15;
                button.clipsToBounds = YES;
                [button sd_setBackgroundImageWithURL:[NSURL URLWithString:usersModel.userAvatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"icon_head_portrait@2x.png"]];
                [_collectView addSubview:button];
                
            }
        }else{
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(40 * 7, 0, 30, 30);
            button.layer.cornerRadius = 15;
            button.clipsToBounds = YES;
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
            button.layer.borderWidth = 0.5;
            [button setTitle:@"更多" forState:UIControlStateNormal];
            [button setFont:[UIFont systemFontOfSize:12]];
            [_collectView addSubview:button];
        }

    }
    //评论
    if (model.comments.count > 0) {
        CGFloat curHeight = 0;
        for (NSInteger i = 0; i < model.comments.count; i++) {
            CommunitComments *commentsModel = model.comments[i];
            
            UILabel *Label = [[UILabel alloc] init];
            Label.numberOfLines = 0;
            Label.font = [UIFont systemFontOfSize:12];
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",commentsModel.title,commentsModel.content]];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, commentsModel.title.length)];
            Label.attributedText = str;
            NSString *normalStr = [NSString stringWithFormat:@"%@%@",commentsModel.title,commentsModel.content];
            CGSize titleSize = [self clacTextSizeWithText:normalStr withWidth:kMainBoundsW - 20 withFont:12];
            [_commentView addSubview:Label];
 
            
            
            if (titleSize.height > 45) {
                titleSize.height = 45;
            }
            Label.frame = CGRectMake(0, curHeight, kMainBoundsW - 20, titleSize.height);
            curHeight += titleSize.height + 10;

            _commentView.sd_layout
            .topSpaceToView(_collectView,10)
            .leftSpaceToView(self.contentView,10)
            .rightSpaceToView(self.contentView,10)
            .heightIs(curHeight);
        }
        
        if (model.comments.count > 1) {
            UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [moreButton setTitle:@"查看更多评论" forState:UIControlStateNormal];
            [moreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [moreButton setFont:[UIFont systemFontOfSize:14]];
            [self.contentView addSubview:moreButton];
            
            
            moreButton.sd_layout
            .topSpaceToView(_commentView,0)
            .leftEqualToView(_commentView)
            .widthIs(100)
            .heightIs(20);
            
            
        }
    }
    
    
    
    
    
    
    
    
}

#pragma mark- scrollView的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger curX = scrollView.contentOffset.x/kMainBoundsW;
    _pageCon.currentPage = curX;
}



//计算字符串的长度
- (CGSize)clacTextSizeWithText:(NSString *)text withWidth:(CGFloat)width withFont:(NSInteger)font{
    return [text boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

//计算高度
- (CGFloat)clacPicsAutoLayoutHeightWith:(CGFloat)height andWidth:(CGFloat)width{
    return 0;
}

//移除所有视图
- (void)setAllDefault{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    [self createView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
