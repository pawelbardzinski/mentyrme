# config/initializers/aws.rb
require 'aws-sdk'
# Rails.configuration.aws is used by AWS, Paperclip, and S3DirectUpload
Rails.configuration.aws = YAML.load(ERB.new(File.read("#{Rails.root}/config/aws.yml")).result)[Rails.env].symbolize_keys!
AWS.config(logger: Rails.logger)
AWS.config(Rails.configuration.aws)

# config/initializers/paperclip.rb
Paperclip::Attachment.default_options.merge!(
url: ':s3_domain_url',
path: ':class/:id/:style/:filename',
storage: :s3,
bucket: ENV['aws_bucket'],
s3_credentials: Rails.configuration.aws,
s3_permissions: :private,
s3_protocol: 'https'
)