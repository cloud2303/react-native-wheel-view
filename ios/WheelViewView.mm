#ifdef RCT_NEW_ARCH_ENABLED
#import "WheelViewView.h"

#import "ComponentDescriptors.h"
#import "EventEmitters.h"
#import "Props.h"
#import "RCTComponentViewHelpers.h"

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface WheelViewView () <RCTWheelViewViewViewProtocol>

@end

@implementation WheelViewView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<WheelViewViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const WheelViewViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<WheelViewViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<WheelViewViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> WheelViewViewCls(void)
{
    return WheelViewView.class;
}

@end
#endif
