output "github_actions_url" {
  value = "Access Web Server here --> http://${aws_instance.example.public_ip}"
}

output "github_actions_ip" {
  value = aws_instance.example.public_ip
}