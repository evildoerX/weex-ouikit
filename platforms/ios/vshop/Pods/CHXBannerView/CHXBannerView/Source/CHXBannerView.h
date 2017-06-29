//
//  CHXBannerView.h
//  CHXBannerView
//
//  Created by Moch Xiao on 2015-03-01.
//  Copyright (c) 2014 Moch Xiao (https://github.com/cuzv).
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>
#import "CHXBannerViewDataSource.h"
#import "CHXBannerViewDelegate.h"

/// 注意，在 autolayout 模式下，需要设置 UIViewController 的 automaticallyAdjustsScrollViewInsets = NO;
@interface CHXBannerView : UIView

/// The page indicator control
@property (nonatomic, strong, readonly) UIPageControl *pageControl;
/// Set the global background image
@property (nonatomic, strong) UIImage *backgroundImage;
/// Auto play the transition animation, default value is YES
@property (nonatomic, assign) BOOL autoPlay;

/// Only when you invoke this method begin play transtion
- (void)reloadData;

#pragma mark -

@property (nonatomic, weak) id <CHXBannerViewDataSource> dataSource;
@property (nonatomic, weak) id <CHXBannerViewDelegate> delegate;

@end
