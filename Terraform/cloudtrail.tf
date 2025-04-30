# S3 Bucket to store CloudTrail logs
resource "aws_s3_bucket" "trail_logs" {
  bucket = "hipaa-trail-logs"
}

# Separate resource: Enable versioning
resource "aws_s3_bucket_versioning" "trail_logs_versioning" {
  bucket = aws_s3_bucket.trail_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Separate resource: Enable encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "trail_logs_encryption" {
  bucket = aws_s3_bucket.trail_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# CloudTrail itself
resource "aws_cloudtrail" "hipaa_trail" {
  name                          = "hipaa-trail"
  s3_bucket_name                = aws_s3_bucket.trail_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}
