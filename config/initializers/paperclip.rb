ActiveRecord::Base.send(:include, Paperclip::S3::Glue) if Rails.env.development?
