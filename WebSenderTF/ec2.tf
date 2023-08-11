resource "aws_instance" "xxxxxxxxxxxxx" {
  ami           = "ami-0c55b159cbfafe1f0"  # ID da AMI do Ubuntu 20.04
  instance_type = "t2.micro"  # Tipo de instância utilizada
  key_name      = "your_key_name"  # Nome da chave SSH para acessar a instância

  tags = {
    Name = "" #Nome da instância EC2
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash",
      "source ~/.nvm/nvm.sh",
      "nvm install --lts",
      "sudo apt-get install -y npm"
      #Comandos utilizados para instalar as dependências necessárias
    ]
  }
}