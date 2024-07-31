export interface TcpPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
