resource "aws_security_group" "xxxxxxxxxxxxx" {
  name_prefix = "xxxxxxxxxxxxxx"#Nome do grupo de segurança

  # Regra de entrada para permitir tráfego HTTP (porta 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = ["0.0.0.0/0"]#Exemplo de ipv4
  }

  # Regra de entrada para permitir tráfego HTTPS (porta 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "https"
    cidr_blocks = ["0.0.0.0/0"]#Exemplo de ipv4
  }

  # Regra de entrada para permitir tráfego em uma porta TCP personalizada(exemplo: porta 8080)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]#Exemplo de ipv4
  }

  # Regra de entrada para permitir tráfego em outra porta TCP personalizada (exemplo: porta 2222)
  ingress {
    from_port   = 2222
    to_port     = 2222
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]#Exemplo de ipv4
  }
}
