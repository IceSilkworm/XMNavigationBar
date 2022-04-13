//
//  XMNavigationBar.h
//  FBSnapshotTestCase
//
//  Created by ring on 2022/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMNavigationBar : UINavigationBar

@property (nonatomic, strong, readonly) UIImageView *shadowImageView;
@property (nonatomic, strong, readonly) UIVisualEffectView *fakeView;
@property (nonatomic, strong, readonly) UIImageView *backgroundImageView;
@property (nonatomic, strong, readonly) UILabel *backButtonLabel;
@property (nonatomic, strong, readonly) UIView *xm_backgroundView;

@end


@interface UILabel (NavigationBarTransition)

@property(nonatomic, strong, nullable) UIColor *xm_specifiedTextColor;

@end


NS_ASSUME_NONNULL_END
