interface SubscribeCommand {
    method: WsMethod,
    params: { [key: string]: string | number | null },
    timeout: number
}