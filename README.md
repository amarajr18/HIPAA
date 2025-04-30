# 🛡️ Secure HIPAA-Compliant Data Storage on AWS

This project provisions a secure, compliant cloud infrastructure for storing **HIPAA-sensitive healthcare data** using **AWS services and Terraform**. It enforces encryption, access control, and full audit trails to ensure **data confidentiality, integrity, and availability**.

---

## 📌 Key Objectives

- Protect sensitive patient data (structured + unstructured)
- Meet HIPAA compliance requirements
- Use Infrastructure as Code (IaC) to automate deployment

---

## 🧰 Technologies Used

| Service        | Purpose                                  |
|----------------|------------------------------------------|
| Amazon S3      | Store unstructured data (SSE-KMS, versioning, object lock) |
| Amazon RDS     | Store structured data (encryption at rest & in-transit) |
| AWS KMS        | Manage encryption keys |
| AWS IAM        | Control access with least privilege and MFA |
| AWS CloudTrail | Maintain secure audit logs |
| Terraform      | Automate infrastructure provisioning |

---

## 🗂️ Project Structure

