import { WebPlugin } from '@capacitor/core';

import type { TcpPlugin } from './definitions';

export class TcpWeb extends WebPlugin implements TcpPlugin {
  async connect(options: { ip: string; port: number }): Promise<void> {
    console.log('Web: connect', options);
    return Promise.resolve();
  }

  async send(options: { data: string }): Promise<void> {
    console.log('Web: send', options);
    return Promise.resolve();
  }

  async disconnect(): Promise<void> {
    console.log('Web: disconnect');
    return Promise.resolve();
  }
}
