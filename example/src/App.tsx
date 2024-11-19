import { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { WheelViewView } from 'react-native-wheel-view';

export default function App() {
  const [selectedIndex, setSelectedIndex] = useState(0);

  return (
    <View style={styles.container}>
      <Text>Hello</Text>
      <View style={styles.pickerView}>
        <WheelViewView
          style={{ flex: 1 }}
          data={['1', '2', '3', '4', '5']}
          selectedIndex={selectedIndex}
          onItemSelected={(event) => {
            console.log(
              event.nativeEvent.data,
              event.nativeEvent.position,
              '选中的'
            );
            setSelectedIndex(event.nativeEvent.position);
          }}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  pickerView: {
    height: 200,
    width: '100%',
  },
});
