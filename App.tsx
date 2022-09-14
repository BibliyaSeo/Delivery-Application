import React from 'react';
import {Provider} from 'react-redux';
import store from './src/store';
import AppInner from './AppInner';

const App = () => {
  return (
    <Provider store={store}>
      <AppInner />
    </Provider>
  );
};

export default App;
