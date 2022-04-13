//
//  XMNavigationController.h
//  FBSnapshotTestCase
//
//  Created by ring on 2022/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMNavigationController : UINavigationController

- (void)updateNavigationBarForViewController:(UIViewController *)vc;

@end

@interface UINavigationController(UINavigationBar) <UINavigationBarDelegate>

@end

@protocol XMNavigationTransitionProtocol <NSObject>

- (void)handleNavigationTransition:(UIScreenEdgePanGestureRecognizer *)pan;

@end


NS_ASSUME_NONNULL_END
