#ifdef RCT_NEW_ARCH_ENABLED
#import "WheelViewView.h"

#import "generated/RNWheelViewViewSpec/ComponentDescriptors.h"
#import "generated/RNWheelViewViewSpec/EventEmitters.h"
#import "generated/RNWheelViewViewSpec/Props.h"
#import "generated/RNWheelViewViewSpec/RCTComponentViewHelpers.h"
#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface WheelViewView () <RCTWheelViewViewViewProtocol, UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation WheelViewView {
    UIPickerView *_pickerView;
    NSArray<NSString *> *_items;
    NSInteger _selectedIndex;
}



- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const WheelViewViewProps>();
    _props = defaultProps;

    _pickerView = [[UIPickerView alloc] init];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self addSubview:_pickerView];

    _selectedIndex = 0;
    _items = @[];

    self.contentView = _pickerView;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<WheelViewViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<WheelViewViewProps const>(props);

    if (oldViewProps.data != newViewProps.data) {
      NSMutableArray<NSString *> *array = [NSMutableArray new];
      for (const auto &item : newViewProps.data) {
            [array addObject:[NSString stringWithUTF8String:item.c_str()]];
        }
    _items = array;
      [_pickerView reloadAllComponents];
    }
  if (oldViewProps.selectedIndex != newViewProps.selectedIndex) {
         _selectedIndex = newViewProps.selectedIndex;
         [_pickerView selectRow:_selectedIndex inComponent:0 animated:YES];
    }

    [super updateProps:props oldProps:oldProps];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _pickerView.frame = self.bounds;
}
#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _items.count;
}
#pragma mark - UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = (UILabel *)view;
    if (!label) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
         label.adjustsFontSizeToFitWidth = YES;
         label.minimumScaleFactor = 0.5;
        label.font = [UIFont systemFontOfSize:20];
    }
    label.text = _items[row];
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_eventEmitter != nullptr) {
        std::dynamic_pointer_cast<const WheelViewViewEventEmitter>(_eventEmitter)
            ->onItemSelected(WheelViewViewEventEmitter::OnItemSelected{
                .data = std::string([_items[row] UTF8String]),
                .position = (int)row,
            });
    }
}

// Event emitter convenience method
- (const WheelViewViewEventEmitter &)eventEmitter {
    return static_cast<const WheelViewViewEventEmitter &>(*_eventEmitter);
}
+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<WheelViewViewComponentDescriptor>();
}

Class<RCTComponentViewProtocol> WheelViewViewCls(void)
{
    return WheelViewView.class;
}

@end
#endif
