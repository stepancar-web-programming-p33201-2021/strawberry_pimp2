enum MessageSender { a, b }

interface MessageModel {
    id: string,
    attachments: { [id: string]: AttachmentModel },
    createdAt: number,
    updatedAt: number | null,
    readAt: number | null,
    messageSender: MessageSender
}