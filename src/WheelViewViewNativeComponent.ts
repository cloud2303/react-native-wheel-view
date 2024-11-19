import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  BubblingEventHandler,
  Int32,
} from 'react-native/Libraries/Types/CodegenTypes';

type PickerItemSelectedEvent = {
  data: string;
  position: Int32;
};
export interface NativeProps extends ViewProps {
  data: string[];
  selectedIndex?: Int32;
  onItemSelected?: BubblingEventHandler<PickerItemSelectedEvent> | null;
}

export default codegenNativeComponent<NativeProps>('WheelViewView');
