export interface TcpPlugin {
  connect(options: { ip: string; port: number }): Promise<void>;
  send(options: { data: string }): Promise<void>;
  disconnect(): Promise<void>;
}
