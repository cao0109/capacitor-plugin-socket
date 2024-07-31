import { WebPlugin } from '@capacitor/core';

import type { TcpPlugin } from './definitions';

export class TcpWeb extends WebPlugin implements TcpPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
