# Main S3 Bucket
resource "aws_s3_bucket" "hipaa_data" {
  bucket = "hipaa-secure-storage-example"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Purpose = "HIPAA Data Storage"
  }
}

# Separate resource: Enable versioning
resource "aws_s3_bucket_versioning" "hipaa_versioning" {
  bucket = aws_s3_bucket.hipaa_data.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Separate resource: Enable Object Lock
resource "aws_s3_bucket_object_lock_configuration" "hipaa_object_lock" {
  bucket = aws_s3_bucket.hipaa_data.id

  rule {
    default_retention {
      mode  = "COMPLIANCE"
      days  = 30
    }
  }
}

# Separate resource: Server-side encryption with KMS
resource "aws_s3_bucket_server_side_encryption_configuration" "hipaa_encryption" {
  bucket = aws_s3_bucket.hipaa_data.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.hipaa_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Public access blocking
resource "aws_s3_bucket_public_access_block" "hipaa_block" {
  bucket                  = aws_s3_bucket.hipaa_data.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
