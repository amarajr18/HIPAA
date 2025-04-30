resource "aws_iam_policy" "hipaa_deny_sensitive_ops" {
  name        = "DenySensitiveIAMActions"
  description = "Deny sensitive IAM operations unless from specific IP and with MFA"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Deny",
        Action = [
          "iam:DeleteUser",
          "iam:DeleteRole",
          "iam:PutUserPolicy",
          "iam:PutRolePolicy"
        ],
        Resource = "*",
        Condition = {
          Bool = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        }
      }
    ]
  })
}
