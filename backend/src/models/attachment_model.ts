enum AttachmentType { document='document', text = 'text', image='image' }

interface AttachmentModel {
    type: string,
    content?: string,
    uint8list?: number[]
    id?: number,
    message_id?: number,
}