//
//  GoodsTableViewCell.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/6.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "GoodsTableViewCell.h"



@interface GoodsTableViewCell (){
    UIView *_bgView;
    UIImageView *_picImage;
    UIImageView *_flogImage;
    UILabel *_countryLabel;
    UILabel *_descriptionLabel;
    UILabel *_priceLabel;
    UILabel *_prePriceLabel;
    
}





@end


@implementation GoodsTableViewCell

- (void)awakeFromNib {
    // Initialization code
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
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, 300)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    _bgView = bgView;
    
//    UIImageView *picImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [bgView addSubview:picImage];
//    _picImage = picImage;
//    
//    UIImageView *flogImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [bgView addSubview:flogImage];
//    _flogImage = flogImage;
//    
//    UILabel *countryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    [bgView addSubview:countryLabel];
//    _countryLabel = countryLabel;
//    
//    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    [bgView addSubview:descriptionLabel];
//    _descriptionLabel = descriptionLabel;
//    
//    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    [bgView addSubview:priceLabel];
//    _priceLabel = priceLabel;
//    
//    
//    UILabel *prePriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    [bgView addSubview:prePriceLabel];
//    _prePriceLabel = prePriceLabel;
    
    
}

- (void)reload{
    
}


#pragma mark- set方法
- (void)setIndex:(NSInteger)index{
    if (_index != index) {
        _index = index;
    }
}

- (void)setIndexArr:(NSMutableArray *)indexArr{
    if (_indexArr != indexArr) {
        _indexArr = indexArr;
    }
}
- (void)setDataArr:(NSMutableArray *)dataArr{
    if (_dataArr != dataArr) {
        _dataArr = dataArr;
        
        
        [self setNeedsLayout];
    }
}


#pragma mark-
- (void)layoutSubviews{
    [super layoutSubviews];
    for (NSInteger i = 0; i < 2; i++) {
        TableViewCellModel *model = self.dataArr[[self.indexArr[i][self.index] integerValue]];
//        NSLog(@"%@",model.myDescription);
//        NSLog(@"%ld",i);
        
        if (model.picUrl) {
            
            UIImageView *picImage = [[UIImageView alloc] init];
            [_bgView addSubview:picImage];
            picImage.frame = CGRectMake(i*(kMainBoundsW/2 - 5 + 10) , 10, kMainBoundsW/2 - 5, model.curHeight);
            [picImage sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
        }
        
        if (model.nationalFlag) {
            UIImageView *flogImage = [[UIImageView alloc] init];
            [_bgView addSubview:flogImage];
            flogImage.frame = CGRectMake(15 + (kMainBoundsW/2 - 5)*i, model.curHeight + 20, 20, 20);
            [flogImage sd_setImageWithURL:[NSURL URLWithString:model.nationalFlag]];
        }
        
        if (model.country) {
            UILabel *countryLabel = [[UILabel alloc] init];
            [_bgView addSubview:countryLabel];
            countryLabel.frame = CGRectMake(40 + (kMainBoundsW/2 - 5)*i, model.curHeight + 20, 50, 20);
            countryLabel.font = [UIFont systemFontOfSize:12];
            countryLabel.text = model.country;
            countryLabel.textColor = [UIColor lightGrayColor];
        }
        
        if (model.myDescription) {
            UILabel *descriptionLabel = [[UILabel alloc] init];
            [_bgView addSubview:descriptionLabel];
            descriptionLabel.frame = CGRectMake(15 + (kMainBoundsW/2 - 5)*i, model.curHeight + 50, kMainBoundsW/2 - 20, 20);
            descriptionLabel.font = [UIFont systemFontOfSize:13];
            descriptionLabel.text = model.myDescription;
        }
        
        //定义一个CGSize对象 用来获取priceLabel内容的长度
        CGSize priceLabelTextSize = CGSizeZero;
        if (model.price) {
            UILabel *priceLabel = [[UILabel alloc] init];
            [_bgView addSubview:priceLabel];
            priceLabel.textColor = [UIColor redColor];
            priceLabel.text = [NSString stringWithFormat:@"¥%@",model.price];
            priceLabel.font = [UIFont systemFontOfSize:20];
            priceLabelTextSize = [self clacTextSizeWithText:priceLabel.text withWidth:100 withFont:20];
            priceLabel.frame = CGRectMake(15 + (kMainBoundsW/2 - 5)*i, model.curHeight + 70, priceLabelTextSize.width, 40);
            
        }
        
        //定义一个CGSize对象 用来获取priceLabel内容的长度
        CGSize prePriceLabelTextSize = CGSizeZero;
        if (model.origin_price) {
            UILabel *prePriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            [_bgView addSubview:prePriceLabel];
            prePriceLabel.text = [NSString stringWithFormat:@"¥%@",model.origin_price];
            prePriceLabel.textColor = [UIColor lightGrayColor];
            prePriceLabel.font = [UIFont systemFontOfSize:12];
            prePriceLabelTextSize = [self clacTextSizeWithText:prePriceLabel.text withWidth:100 withFont:12];
            prePriceLabel.frame = CGRectMake(20 + (kMainBoundsW/2 - 5)*i + priceLabelTextSize.width, model.curHeight + 82, prePriceLabelTextSize.width, 20);
            
            
            UILabel *lineLabel = [[UILabel alloc] init];
            lineLabel.backgroundColor = [UIColor lightGrayColor];
            lineLabel.center = prePriceLabel.center;
            lineLabel.bounds = CGRectMake(0,0,prePriceLabelTextSize.width, 1);
            [_bgView addSubview:lineLabel];
            
        }
        
        
    }
    
    
    
}

//计算字符串的长度
- (CGSize)clacTextSizeWithText:(NSString *)text withWidth:(CGFloat)width withFont:(NSInteger)font{
    return [text boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}


- (void)setAllDefault{
    [_bgView removeFromSuperview];
    _bgView = nil;
    [self createView];
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
