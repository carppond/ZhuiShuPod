//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  ZhuiShuPod.m
//  ZhuiShuPod
//
//  Created by cf on 2018/11/18.
//  Copyright (c) 2018 cf. All rights reserved.
//

#import "ZhuiShuPod.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>

@interface YJReadingToolsView
{
    UIButton *serviceBtn;
}
- (void)changeSourceBtnClicked;
@end

@interface ReadThemeManager

+ (id)shareInstance;

- (id)themeImageWithName:(id)arg1;

@end

@interface ChangeResourceViewController
{
    NSMutableArray *resourceListArr;
}
@end
@interface BookShelfAdItem

@end

@interface YJSplashAdHandler

- (void)hidenSplashView;

- (void)createSplashTopAdView;

@end

@interface YJActivityFloatLayerView

- (void)onClickCloseButton;

@end

CHDeclareClass(ReadThemeManager)

CHOptimizedMethod1(self, id, ReadThemeManager, themeImageWithName, NSString *, arg1) {
    
    if ([arg1 isEqualToString:@"read_icon_service_32_32"]) {
        arg1 = @"reader_top_huanyuan_24_24";
    }
    return CHSuper1(ReadThemeManager, themeImageWithName, arg1);
}

CHDeclareClass(YJSplashAdHandler)

CHOptimizedMethod0(self, id, YJSplashAdHandler, createSplashTopAdView) {
    [self hidenSplashView];
    return nil;
}

CHDeclareClass(MSBookShelfDataSource)

CHOptimizedMethod0(self, id, MSBookShelfDataSource, bookDataArr){
    
    NSArray * fsdf = CHSuper0(MSBookShelfDataSource, bookDataArr);
    NSMutableArray *tmpArrayM = [NSMutableArray array];
    [fsdf enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {//BookShelfAdItem
        if (![obj isKindOfClass:(objc_getClass("BookShelfAdItem"))] &&
            ![obj isKindOfClass:(objc_getClass("LFIconAdView"))] &&
            ![obj isKindOfClass:(objc_getClass("YJHMADAdView"))]) {
            [tmpArrayM addObject:obj];
        }
    }];
    return tmpArrayM;
}
CHDeclareClass(Constants)

CHClassMethod1(BOOL, Constants, allowPirateWithBookId, id, arg1) {
    return YES;
}

CHDeclareClass(SqliteUtils)

CHOptimizedMethod1(self, BOOL, SqliteUtils, bookAllowPirateResource, id, arg1) {
    
    return YES;
}

CHOptimizedMethod1(self, BOOL, SqliteUtils, bookAllowPirateReading, id, arg1) {
    
    return NO;
}

CHDeclareClass(YJReadingToolsView)

CHOptimizedMethod1(self, void, YJReadingToolsView, onClickServiceBtn, id, arg1) {
    [self changeSourceBtnClicked];
}

CHDeclareClass(YJActivityFloatLayerView)
CHOptimizedMethod1(self, id, YJActivityFloatLayerView, initWithFrame,CGRect,arg1) {
    return nil;
}
CHOptimizedMethod0(self, void, YJActivityFloatLayerView, createView) {
    [self onClickCloseButton];
}

CHConstructor{
    
    CHLoadLateClass(YJSplashAdHandler);
    CHHook0(YJSplashAdHandler, createSplashTopAdView);
    
    CHLoadLateClass(MSBookShelfDataSource);
    CHHook0(MSBookShelfDataSource, bookDataArr);
    
    
    CHLoadLateClass(Constants);
    CHClassHook1(Constants, allowPirateWithBookId);
    
    CHLoadLateClass(SqliteUtils);
    CHHook1(SqliteUtils, bookAllowPirateResource);
    CHHook1(SqliteUtils, bookAllowPirateReading);
    
    CHLoadLateClass(YJReadingToolsView);
    CHHook1(YJReadingToolsView, onClickServiceBtn);
    
    
    CHLoadLateClass(YJActivityFloatLayerView);
    CHHook1(YJActivityFloatLayerView, initWithFrame);
    CHHook0(YJActivityFloatLayerView, createView);
    
    CHLoadLateClass(ReadThemeManager);
    CHHook1(ReadThemeManager, themeImageWithName);
};







