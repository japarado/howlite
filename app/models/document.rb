class Document < ApplicationRecord
  belongs_to :document_space
  mount_uploader :attachment, AttachmentUploader
end
