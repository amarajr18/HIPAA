resource "aws_kms_key" "hipaa_key" {
  description             = "KMS key for HIPAA data encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = {
    Purpose = "HIPAA Encryption"
  }
}
