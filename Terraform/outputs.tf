output "s3_bucket" {
  value = aws_s3_bucket.hipaa_data.bucket
}

output "kms_key_id" {
  value = aws_kms_key.hipaa_key.id
}