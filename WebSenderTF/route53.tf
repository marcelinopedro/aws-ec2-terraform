resource "aws_route53_record" "dns_record" {
  zone_id = "your_zone_id"  # Substitua pelo ID da zona DNS no Route 53
  name    = "example.com"   # Substitua pelo nome do subdomínio ou domínio que deseja usar
  type    = "A"
  ttl     = "300"

  records = ["xxxxxxxxxxxxxx"]  # Substitua pelo endereço IP privado da instância EC2

  # Dependência da instância EC2
  depends_on = [aws_instance.xxxxxxxxxxxxx]#Associe o nome da instância utilizada
}
