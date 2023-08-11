resource "aws_iam_user" "xxxxxxxxxxxxxxx" {
  name = "xxxxxxxxx" # Nome do usuário IAM
}

# Recurso para criar a política customizada com acesso apenas ao EC2
resource "aws_iam_policy" "ec2_access_policy" {
  name = "ec2-access-policy"

  # Defina as permissões de acesso ao EC2
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:Get*",
          "ec2:List*",
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "ec2:StartInstances",
        Resource = aws_instance.xxxxxxxxxxxxxxx.arn
      },
      {
        Effect   = "Allow",
        Action   = "ec2:StopInstances",
        Resource = aws_instance.xxxxxxxxxxxxxxx.arn
      }
    ]
  })
}

# Vincular a política ao usuário IAM
resource "aws_iam_user_policy_attachment" "attach_ec2_policy" {
  user       = aws_iam_user.xxxxxxxxxxxxxxx.name
  policy_arn = aws_iam_policy.ec2_access_policy.arn
}

# Recurso para adicionar permissões de acesso ao bucket S3 para o usuário IAM
resource "aws_s3_bucket_policy" "s3_bucket_access" {
  bucket = aws_s3_bucket.data_bucket.id

  # Defina as permissões de acesso ao bucket S3 para o usuário IAM
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${aws_caller_identity.xxxxxxxxx.account_id}:user/xxxxxxx"
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
