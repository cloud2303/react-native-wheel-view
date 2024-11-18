// This guard prevent this file to be compiled in the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
#import <React/RCTViewComponentView.h>
#import <UIKit/UIKit.h>

#ifndef WheelViewViewNativeComponent_h
#define WheelViewViewNativeComponent_h

NS_ASSUME_NONNULL_BEGIN

@interface WheelViewView : RCTViewComponentView
@end

NS_ASSUME_NONNULL_END

#endif /* WheelViewViewNativeComponent_h */
#endif /* RCT_NEW_ARCH_ENABLED */
