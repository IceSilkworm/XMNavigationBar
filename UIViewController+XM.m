//
//  UIViewController+XM.m
//  FBSnapshotTestCase
//
//  Created by ring on 2022/4/13.
//

#import "UIViewController+XM.h"
#import <objc/runtime.h>
#import "XMNavigationController.h"

@implementation UIViewController (XM)

- (BOOL)xm_blackBarStyle{
    return self.xm_barStyle == UIBarStyleBlack;
}

- (void)setXm_blackBarStyle:(BOOL)xm_blackBarStyle{
    self.xm_barStyle = xm_blackBarStyle ? UIBarStyleBlack : UIBarStyleDefault;
}

- (UIBarStyle)xm_barStyle {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return [obj integerValue];
    }
    return [UINavigationBar appearance].barStyle;
}

- (void)setXm_barStyle:(UIBarStyle)xm_barStyle {
    objc_setAssociatedObject(self, @selector(xm_barStyle), @(xm_barStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)xm_barTintColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setXm_barTintColor:(UIColor *)tintColor {
     objc_setAssociatedObject(self, @selector(xm_barTintColor), tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)xm_barImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setXm_barImage:(UIImage *)image {
    objc_setAssociatedObject(self, @selector(xm_barImage), image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)xm_tintColor {
    id obj = objc_getAssociatedObject(self, _cmd);
    return (obj ?: [UINavigationBar appearance].tintColor) ?: UIColor.blackColor;
}

- (void)setXm_tintColor:(UIColor *)tintColor {
    objc_setAssociatedObject(self, @selector(xm_tintColor), tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)xm_titleTextAttributes {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    
    UIBarStyle barStyle = self.xm_barStyle;
    NSDictionary *attributes = [UINavigationBar appearance].titleTextAttributes;
    if (attributes) {
        if (![attributes objectForKey:NSForegroundColorAttributeName]) {
            NSMutableDictionary *mutableAttributes = [attributes mutableCopy];
            if (barStyle == UIBarStyleBlack) {
                [mutableAttributes addEntriesFromDictionary:@{ NSForegroundColorAttributeName: UIColor.whiteColor }];
            } else {
                [mutableAttributes addEntriesFromDictionary:@{ NSForegroundColorAttributeName: UIColor.blackColor }];
            }
            return mutableAttributes;
        }
        return attributes;
    }
    
    if (barStyle == UIBarStyleBlack) {
        return @{ NSForegroundColorAttributeName: UIColor.whiteColor };
    } else {
        return @{ NSForegroundColorAttributeName: UIColor.blackColor };
    }
}

- (void)setXm_titleTextAttributes:(NSDictionary *)attributes {
    objc_setAssociatedObject(self, @selector(xm_titleTextAttributes), attributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)xm_extendedLayoutDidSet {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : NO;
}

- (void)setXm_extendedLayoutDidSet:(BOOL)didSet {
    objc_setAssociatedObject(self, @selector(xm_extendedLayoutDidSet), @(didSet), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (float)xm_barAlpha {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (self.xm_barHidden) {
        return 0;
    }
    return obj ? [obj floatValue] : 1.0f;
}

- (void)setXm_barAlpha:(float)alpha {
    objc_setAssociatedObject(self, @selector(xm_barAlpha), @(alpha), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)xm_barHidden {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : NO;
}

- (void)setXm_barHidden:(BOOL)hidden {
    if (hidden) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.titleView = [UIView new];
    } else {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.titleView = nil;
    }
    objc_setAssociatedObject(self, @selector(xm_barHidden), @(hidden), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)xm_barShadowHidden {
    id obj = objc_getAssociatedObject(self, _cmd);
    return  self.xm_barHidden || obj ? [obj boolValue] : NO;
}

- (void)setXm_barShadowHidden:(BOOL)hidden {
    objc_setAssociatedObject(self, @selector(xm_barShadowHidden), @(hidden), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)xm_backInteractive {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : YES;
}

-(void)setXm_backInteractive:(BOOL)interactive {
    objc_setAssociatedObject(self, @selector(xm_backInteractive), @(interactive), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)xm_swipeBackEnabled {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : YES;
}

- (void)setXm_swipeBackEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, @selector(xm_swipeBackEnabled), @(enabled), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)xm_clickBackEnabled {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : YES;
}

- (void)setXm_clickBackEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, @selector(xm_clickBackEnabled), @(enabled), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)xm_splitNavigationBarTransition {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : NO;
}

- (void)setXm_splitNavigationBarTransition:(BOOL)splitNavigationBarTransition {
    objc_setAssociatedObject(self, @selector(xm_splitNavigationBarTransition), @(splitNavigationBarTransition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)xm_computedBarShadowAlpha {
    return  self.xm_barShadowHidden ? 0 : self.xm_barAlpha;
}

- (UIImage *)xm_computedBarImage {
    UIImage *image = self.xm_barImage;
    if (!image) {
        if (self.xm_barTintColor != nil) {
            return nil;
        }
        image = [[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault];
    }
    return image;
}

- (UIColor *)xm_computedBarTintColor {
    if (self.xm_barHidden) {
        return UIColor.clearColor;
    }
    
    if (self.xm_barImage) {
        return nil;
    }
    
    UIColor *color = self.xm_barTintColor;
    if (!color) {
        if ([[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault] != nil) {
            return nil;
        }
        if ([UINavigationBar appearance].barTintColor != nil) {
            color = [UINavigationBar appearance].barTintColor;
        } else {
            color = [UINavigationBar appearance].barStyle == UIBarStyleDefault ? [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:0.8]: [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.729];
        }
    }
    return color;
}

- (void)xm_setNeedsUpdateNavigationBar {
    if (self.navigationController && [self.navigationController isKindOfClass:[XMNavigationController class]]) {
        XMNavigationController *nav = (XMNavigationController *)self.navigationController;
        if (self == nav.topViewController) {
            [nav updateNavigationBarForViewController:self];
            [nav setNeedsStatusBarAppearanceUpdate];
        }
    }
}

@end
