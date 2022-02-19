enum AttachmentType { document, text, image, sticker }

interface AttachmentModel {
    type: AttachmentType,
    content: string,
    id: string
}