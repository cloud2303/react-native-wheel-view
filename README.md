# react-native-wheel-view

native wheel view

## Installation

```sh
npm install react-native-wheel-view
```

## Usage

```js
import { WheelViewView } from 'react-native-wheel-view';

// 高度不能为0
<WheelViewView
  style={{ flex: 1 }}
  data={['1', '2', '3', '4', '5']}
  selectedIndex={selectedIndex}
  onItemSelected={(event) => {
    console.log(event.nativeEvent.data, event.nativeEvent.position, '选中的');
    setSelectedIndex(event.nativeEvent.position);
  }}
/>;
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
