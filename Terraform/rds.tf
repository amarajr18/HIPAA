resource "aws_db_instance" "hipaa_db" {
  allocated_storage       = 20
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  db_name                 = "hipaadb"
  username                = "admin"
  password                = "StrongPassword123!"
  multi_az                = true
  storage_encrypted       = true
  kms_key_id              = aws_kms_key.hipaa_key.arn
  backup_retention_period = 7
  skip_final_snapshot     = true

  tags = {
    Name = "HIPAA RDS"
  }
}
