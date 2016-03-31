//
//  SystemCell.m
//  CollectionViewDemo
//
//  Created by Jiayu_Zachary on 15/12/17.
//  Copyright © 2015年 Zachary. All rights reserved.
//

#import "SystemCell.h"

@implementation SystemCell {
    UILabel *_title;
    UIButton *_detailBtn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildLayout];
    }
    return self;
}

- (void)systemCellWithIndex:(NSInteger)index dictionary:(NSDictionary *)dict {
    if (index == 0) {
        self.backgroundColor = [UIColor purpleColor];
    }
    else if (index == 1) {
        self.backgroundColor = [UIColor greenColor];
    }
    else {
        self.backgroundColor = [UIColor cyanColor];
    }
    
}

#pragma mark - action
- (void)detailAction {
    XXZLog(@"detail..");
}

#pragma mark - build layout
- (void)buildLayout {
    [self loadTitleView];
    [self loadDetailButton];
}

#pragma mark - loading
- (void)loadDetailButton {
    if (_detailBtn == nil) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _detailBtn.frame = CGRectMake(self.frame.size.width-15-_title.frame.size.width, 10, _title.frame.size.width, _title.frame.size.height);
        _detailBtn.backgroundColor = [UIColor whiteColor];
        ViewRadius(_detailBtn, 3.0);
        [_detailBtn setTitle:@"detail" forState:UIControlStateNormal];
        [_detailBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:_detailBtn];
        
        [_detailBtn addTarget:self action:@selector(detailAction) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)loadTitleView {
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(15, 10, 100, 40);
        _title.backgroundColor = [UIColor whiteColor];
        _title.text = @"title";
        _title.textColor = [UIColor blackColor];
        ViewRadius(_title, 3.0);
        [self addSubview:_title];
    }
}

#pragma mark - getter


#pragma mark - dealloc
- (void)dealloc {
    
}

#pragma mark - other

@end
