//
//  UIViewController+XMNavigationController.h
//  XMNavigationBar
//
//  Created by ring on 2022/4/13.
//

#import <UIKit/UIKit.h>

@class XMNavigationController;

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (XMNavigationController)

@property (nonatomic, assign) IBInspectable BOOL xm_blackBarStyle;
@property (nonatomic, assign) UIBarStyle xm_barStyle;
@property (nonatomic, strong) IBInspectable UIColor *xm_barTintColor;
@property (nonatomic, strong) IBInspectable UIImage *xm_barImage;
@property (nonatomic, strong) IBInspectable UIColor *xm_tintColor;
@property (nonatomic, strong) NSDictionary *xm_titleTextAttributes;
@property (nonatomic, assign) IBInspectable float xm_barAlpha;
@property (nonatomic, assign) IBInspectable BOOL xm_barHidden;
@property (nonatomic, assign) IBInspectable BOOL xm_barShadowHidden;
@property (nonatomic, assign) IBInspectable BOOL xm_backInteractive;
@property (nonatomic, assign) IBInspectable BOOL xm_swipeBackEnabled;
@property (nonatomic, assign) IBInspectable BOOL xm_clickBackEnabled;
@property (nonatomic, assign) IBInspectable BOOL xm_splitNavigationBarTransition;

// computed
@property (nonatomic, assign, readonly) float xm_computedBarShadowAlpha;
@property (nonatomic, strong, readonly) UIColor *xm_computedBarTintColor;
@property (nonatomic, strong, readonly) UIImage *xm_computedBarImage;

/*!
 *  @brief @c self\.navigationController will get a wrapping @c UINavigationController, use this property to get the real navigation controller
 */
@property (nonatomic, readonly, strong) XMNavigationController *xm_navigationController;

/*!
 *  @brief @c This property is for internal use
 */
@property (nonatomic, assign) BOOL xm_extendedLayoutDidSet;

- (void)xm_setNeedsUpdateNavigationBar;

@end

NS_ASSUME_NONNULL_END
