import { registerPlugin } from '@capacitor/core';

import { TcpPlugin } from './definitions';

const TcpPlugin = registerPlugin<TcpPlugin>('TcpPlugin', {
  web: () => import('./web').then(m => new m.TcpWeb()),
});

export * from './definitions';
export { TcpPlugin };
