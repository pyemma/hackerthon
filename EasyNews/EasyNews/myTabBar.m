//
//  myTabBar.m
//  tabBar
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "myTabBar.h"

@interface myTabBar()

@property (nonatomic, strong) NSMutableArray *btns;

@property (nonatomic, strong) UIButton *preSelectedBtn;

@property (nonatomic, strong) UIImageView *selectedBg;

@end

@implementation myTabBar

- (instancetype)init
{
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.selectedBg];
        
    }
    return self;
}

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    
    return _btns;
}

- (UIImageView *)selectedBg

{
    if (!_selectedBg) {
        _selectedBg = [[UIImageView alloc] init];
        _selectedBg.image = [UIImage imageNamed:@"toolBar_shade"];
        
    }

    return _selectedBg;
}

- (void)addItemWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName
{
    
    //1.创建按钮,设置对应状态的图片
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateDisabled];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    [self.btns addObject:btn];
    
    
    if (self.btns.count == 1) {
        btn.enabled = NO;
        self.preSelectedBtn = btn;
    }
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //布局子控件-按钮
    CGFloat btnY = 3;
    CGFloat btnW = self.frame.size.width / self.btns.count;
    CGFloat btnH = self.frame.size.height;
    
    for (int i = 0; i < self.btns.count; i++) {
        
        CGFloat btnX = btnW * i;
        
        UIButton *btn = self.btns[i];
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }
  
}


- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    self.selectedBg.frame = CGRectMake(0, 3, self.frame.size.width / self.btns.count, self.frame.size.height);
}


- (void)btnClick:(UIButton *)btn
{
    
    
    
    
    if ([self.delegate respondsToSelector:@selector(myTabBar:didSelectedAtIndex:)]) {
        
        [self.delegate myTabBar:self didSelectedAtIndex:[self.btns indexOfObject:btn]];
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.selectedBg.frame = btn.frame;
        
    }];
    
    btn.enabled = NO;
    self.preSelectedBtn.enabled = YES;
    self.preSelectedBtn = btn;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        //1 缩小
        btn.transform = CGAffineTransformMakeScale(0.7, 0.7);
        
    } completion:^(BOOL finished) {
        
        //2.放大
        [UIView animateWithDuration:0.1 animations:^{
            
            
            btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
            
        } completion:^(BOOL finished) {
            
            //3.再缩小
            [UIView animateWithDuration:0.1 animations:^{
                
                btn.transform = CGAffineTransformIdentity;
                
                
            }];
            
        }];
        
        
    }];
    
}

@end
