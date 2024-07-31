import { registerPlugin } from '@capacitor/core';

import type { TcpPlugin } from './definitions';

const Tcp = registerPlugin<TcpPlugin>('Tcp', {
  web: () => import('./web').then(m => new m.TcpWeb()),
});

export * from './definitions';
export { Tcp };
