//
//  MMHomeTableHeaderView.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeTableHeaderView.h"
#import "MMBackScrollView.h"

@interface MMHomeTableHeaderView ()<MMBackScrollViewDelegate>

@property (nonatomic,retain)MMBackScrollView * backScroll;

@end

@implementation MMHomeTableHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
     self.backScroll = [[MMBackScrollView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) AndSuperView:self Delegate:self];
    [self addSubview:self.backScroll];
     [self.backScroll upDataScrollViewImageArray:@[[UIImage imageNamed:@"zhiboliebiao-bnanner1"],[UIImage imageNamed:@"zhiboliebiao-bnanner2"],[UIImage imageNamed:@"zhiboliebiao-bnanner3"],] PlaceholderImage:[UIImage imageNamed:@"zhiboliebiao-bnanner3"]];
}



/** 设置滚动时间间隔 */
- (CGFloat)scrollToNextImageTimeInterval:(MMBackScrollView *)backScrollView{
    return 2.f;
}

/** 设置图片呗点击的代理 */
- (void)setMMBackScrollView:(MMBackScrollView *)backScrollView ImageViewDidCliked:(NSInteger)imageIndex{
    NSLog(@"%ld",imageIndex);
}
/** 设置选中的页码颜色 */
- (UIColor *)setMMBackScrollViewCurrentPageIndicatorTintColor:(MMBackScrollView *)backScrollView{
    return [UIColor whiteColor];
}
/** 设置未选中的页码颜色 */
- (UIColor *)setMMBackScrollViewPageIndicatorTintColor:(MMBackScrollView *)backScrollView{
    return [UIColor blackColor];
}
/** 设置默认页数 */
- (NSInteger)setMMBackScrollViewCurrentPageNumber:(MMBackScrollView *)backScrollView{
    return 0;
}
/**用户拖拽之后滚动动画暂停，等待timeInterval 秒后继续开始滚动动画*/
- (CGFloat)setMMBackScrollViewDranggingStartScrollTimeInterval:(MMBackScrollView *)backScrollView{
    return 2.f;
}
/** 设置轮播图，动画的时间间隔 */
- (NSTimeInterval)setMMBackScrollViewAnimationTimeIntervalBackScrollView:(MMBackScrollView *)backScrollView{
    return 0.35f;
}
@end
