Paperclip::Attachment.default_options.merge!(
    :path => ":rails_root/public/system/:attachment/images/:id/:style/:basename.:extension", 
    :url => "/system/:attachment/images/:id/:style/:basename.:extension"
)