resource "aws_s3_bucket" "data_bucket" {
  bucket = "xxxxxxxxxxxxxxx"  # Substitua pelo nome único do seu bucket
  acl    = "private"

  # Configuração de controle de acesso
  # A política de acesso será vinculada ao IAM user
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${aws_caller_identity.current.account_id}:user/xxxxxxx"
        },
        Action    = "s3:*",
        Resource  = [
          "${aws_s3_bucket.data_bucket.arn}",
          "${aws_s3_bucket.data_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Output para exibir o nome do bucket criado
output "bucket_name" {
  value = aws_s3_bucket.data_bucket.id
}
