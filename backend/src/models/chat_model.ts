interface ChatModel {
    id: number,
    created_at: string,
    user_a: number,
    user_b: number,
    messages_list_id?: number,
    last_message?: string
}

interface ChatModelFourUser {
    id: number,
    created_at: string,
    user_a: UserModel,
    user_b: UserModel,
    messages_list_id?: number,
    last_message?: string
}