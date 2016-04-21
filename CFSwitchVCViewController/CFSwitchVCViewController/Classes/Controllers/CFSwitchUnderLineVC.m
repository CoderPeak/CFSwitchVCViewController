//
//  CFSwitchUnderLineVC.m
//  CFSwitchUnderLineVC
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2016年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import "CFSwitchUnderLineVC.h"
#import "UIView+Frame.h"
#import "NSString+Additions.h"
#import "CFMacro.h"
#import "CFTitleButton.h"
#import "UIColor+Additions.h"
#import "CFShowContentVC.h"

#define kViewTagConstant 1  // 所有tag都加上这个
#define kTitleBtnWidth (self.titleTotalW/(self.titleArr.count+1))  // 视频列表 标题按钮 宽

@interface CFSwitchUnderLineVC () <UIScrollViewDelegate>

/* 大背景为UIScrollView */
@property (nonatomic, strong) UIScrollView *bgScrollView;

/* 分类的标题View 是UIScrollView 当所有分类超过屏幕宽度时可以自适应滑动 */
@property (nonatomic, strong) UIScrollView *titleScrollView;

/* 分类标题View 下面的 短横线指示线 */
@property (nonatomic, strong) UIView *titleUnderlineView;

/* 标题的分类 数组 */
@property (nonatomic, strong) NSArray *titleArr;

/* 标题宽度是否平均 */
@property (nonatomic, assign) BOOL avergTitle;

/* 分类标题 总宽度 */
@property (nonatomic, assign)CGFloat titleTotalW;

/** 分类标题按钮 数组 */
@property (nonatomic, strong) NSMutableArray *titleBtnArr;

/** 记录上一次点击的标题按钮 */
@property (nonatomic, weak) UIButton *clickedTitleButton;

@end

@implementation CFSwitchUnderLineVC

- (instancetype)init
{
    if (self = [super init]) {
        self.titleArr = @[@"席琳·迪翁", @"刘德华", @"CF", @"孙耀威", @"张卫健", @"梁朝伟", @"范文芳", @"窦文涛", @"高圆圆"];
//        self.titleArr = @[@"席琳·迪翁", @"刘德华", @"CF", @"孙耀威", @"张卫健", @"梁朝伟", @"范文芳"];
//        self.titleArr = @[@"席琳·迪翁", @"刘德华", @"CF", @"孙耀威"];
//        self.titleArr = @[@"席琳·迪翁", @"刘德华", @"CF"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    self.navigationItem.title = @"指示器为下划线";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 大背景为UIScrollView
    [self.view addSubview:self.bgScrollView];
    // 分类标题view 也是UIScrollowView
    [self.view addSubview:self.titleScrollView];
    
    // 设置 子控制器
    [self setupAllChildVCs];
    // 默认显示第0个控制器的view
    [self scrollViewDidEndScrollingAnimation:self.bgScrollView];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - lazy
/* 分类的标题View 是UIScrollView 当所有分类超过屏幕宽度时可以自适应滑动 */
- (UIScrollView *)titleScrollView {
    if (!_titleScrollView) {

        // 滑动scrollView 分类1，分类2，分类3，分类4，分类5。。。
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 , self.bgScrollView.cf_width, 45)];
        
        _titleScrollView.backgroundColor = [UIColor whiteColor];
        
        // 标题底部的指示线---短横线
        self.titleUnderlineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_titleScrollView.frame)-2, _titleScrollView.cf_width, 2)];
        
        self.titleUnderlineView.backgroundColor = APPMainColor;
        [_titleScrollView addSubview:self.titleUnderlineView];
      
        [self.bgScrollView addSubview:_titleScrollView];
        
    
        CGFloat titleW = 0;
        CGFloat titleH = _titleScrollView.cf_height;
        CGFloat titleX = 0;
        
        CGFloat totalW = 0;
        
        // 添加所有的标题文字按钮（所有的按钮）
        for (int i = 0; i < self.titleArr.count; i++) {
            NSString *titleStr = self.titleArr[i];
            
            titleW = [[NSString stringWithFormat:@"   %@  ",titleStr] widthWithSize:CGSizeMake(MAXFLOAT, titleH) fontSize:18 otherAttributes:nil context:nil];
            
            // 当分类个数小于5个 且 分类文字宽度小于平均宽度的时候  平均分配
            if (self.titleArr.count<=5 && titleW <= CFScreenWidth/self.titleArr.count)  {
                titleW = CFScreenWidth/self.titleArr.count;
                self.avergTitle=YES;
                /* 根据 titles内容  设置titleScrollV的 滚动区域contentSize */
            }
            totalW = totalW+titleW;
            titleX = totalW - titleW;
            self.titleTotalW = totalW;
            // 创建按钮
            CFTitleButton *titleButton = [CFTitleButton buttonWithType:UIButtonTypeCustom];
            titleButton.tag = i + kViewTagConstant;   // 所有tag都加上这个
            [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [_titleScrollView addSubview:titleButton];
            [self.titleBtnArr addObject:titleButton];
            
            // 设置文字
            [titleButton setTitle:self.titleArr[i] forState:UIControlStateNormal];
            titleButton.titleLabel.font = [UIFont systemFontOfSize:18];
            
            // 设置frame
            titleButton.frame = CGRectMake(titleX, 0, titleW, titleH);
            
            
            // 默认选中第0个按钮
            
            if (i == 0) {
                titleButton.selected = YES;
                self.clickedTitleButton = titleButton;
                self.titleUnderlineView.cf_width = titleButton.cf_width;

                self.titleUnderlineView.cf_centerX = titleButton.cf_centerX;
            }
            
            // 马上根据文字设置内部label的尺寸
            [titleButton.titleLabel sizeToFit];
            
        }
        
        _titleScrollView.contentSize = CGSizeMake(totalW, 0);
        _titleScrollView.showsHorizontalScrollIndicator = NO;
    }
    
    return _titleScrollView;
}

- (NSMutableArray *)titleBtnArr
{
    if (!_titleBtnArr) {
        _titleBtnArr = [NSMutableArray array];
    }
    return _titleBtnArr;
}

/* 大背景ScrollView */
- (UIScrollView *)bgScrollView {
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _bgScrollView.delegate = self;
        _bgScrollView.pagingEnabled = YES;
        _bgScrollView.showsHorizontalScrollIndicator = YES;
        _bgScrollView.showsVerticalScrollIndicator = YES;
    }
    
    return _bgScrollView;
}


#pragma mark - 所有 子控制器
- (void)setupAllChildVCs
{
    
    /* 根据 titles内容  设置titleScrollV的 滚动区域contentSize */
    self.bgScrollView.contentSize = CGSizeMake(self.titleBtnArr.count * CFScreenWidth, 0);
   
    // 循环添加 所有的 vc内容
    for (NSInteger i = 0; i < self.titleArr.count; i++) {
        CFShowContentVC *vc = [[CFShowContentVC alloc] init];
        vc.imgNameStr = self.titleArr[i];
        [self addChildViewController:vc];
    }
}


    
#pragma mark - button actions
/**
 *  点击了顶部的标题按钮
 */
- (void)titleClick:(UIButton *)btn
{
    // 修改按钮状态
    self.clickedTitleButton.selected = NO;
    btn.selected = YES;
    self.clickedTitleButton = btn;
    
    // 移动 底部下划线
    [UIView animateWithDuration:0.25 animations:^{

        self.titleUnderlineView.cf_width = btn.cf_width;

        self.titleUnderlineView.cf_centerX = btn.cf_centerX;
    }];
    
    //   让bgScrollView滚动到对应的位置
    CGPoint offset = self.bgScrollView.contentOffset;
    offset.x = (btn.tag-kViewTagConstant) * self.bgScrollView.frame.size.width;
    [self.bgScrollView setContentOffset:offset animated:YES];
    
    // 同时让 titleScrollView 滚动到相应位置
    NSInteger index = btn.tag-1;
    offset = self.titleScrollView.contentOffset;
    CGFloat leftX = index * kTitleBtnWidth;
    CGFloat rightX = self.titleScrollView.contentSize.width - leftX;
    
    // 左边 往右滑
    if (leftX > self.view.cf_width/2 && rightX>self.view.cf_width/2) {
        offset.x = (index-self.view.cf_width / 2 / kTitleBtnWidth) * kTitleBtnWidth;
    } else if(leftX < self.view.cf_width / 2){ // 左边 往左滑
        offset.x = 0;
    } else if(rightX < self.view.cf_width / 2){ // 右边 往右滑
        offset.x = self.titleScrollView.contentSize.width - self.view.cf_width;
    }
    [self.titleScrollView setContentOffset:offset animated:YES];
    
    
}

#pragma mark - <UIScrollViewDelegate>
/**
 *  滚动完毕就会调用（不是人为拖拽scrollView导致滚动完毕）
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // 如果这个子控制器的view已经添加过了，就直接返回
    if (willShowChildVc.isViewLoaded) return;
    
    /* 添加子控制器的view */
    willShowChildVc.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVc.view];
 
}

/**
 *  滚动完毕就会调用（人为拖拽scrollView导致滚动完毕）
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 点击对应的按钮  并 让scrollView滚动到相应位置
    [self titleClick:self.titleBtnArr[index]];
    
    //   并添加子控制器的view
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    
    // 同时让 titleScrollView 滚动到相应位置
    CGPoint offset = self.titleScrollView.contentOffset;
    
    CGFloat leftX = index * kTitleBtnWidth;
    
    CGFloat rightX = self.titleScrollView.contentSize.width - leftX;
    
    // 左边 往右滑
    if (leftX > self.view.cf_width/2 && rightX>self.view.cf_width/2) {
        offset.x = (index-self.view.cf_width / 2 / kTitleBtnWidth) * kTitleBtnWidth;
        
    } else if(leftX < self.view.cf_width / 2){ // 左边 往左滑
        offset.x = 0;
    } else if(rightX < self.view.cf_width / 2){ // 右边 往右滑
        offset.x = self.titleScrollView.contentSize.width - self.view.cf_width;
    }
    [self.titleScrollView setContentOffset:offset animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
