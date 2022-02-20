enum MessageSender { a, b }

interface MessageModel {
    id?: number,
    attachments: AttachmentModel[],
    created_at?: string,
    updated_at?: string,
    read_at?: string,
    message_sender?: string
}

interface MessageModelService {
    id?: string,
    attachments: AttachmentModel[],
    createdAt?: number,
    updatedAt?: number,
    readAt?: number,
    messageSender?: MessageSender
}

interface MessageTableElement {
    id: number,
    created_at: string,
    updated_at?: string,
    read_at?: string
    message_sender_id: number
}