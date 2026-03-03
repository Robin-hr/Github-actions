data "aws_vpc" "default" {
  default = true
}
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.inatance_type
  key_name = var.key_name
  
  vpc_security_group_ids = [aws_security_group.default_sg.id]
  associate_public_ip_address = true 

   user_data = <<-EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

cat <<'HTML' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hebrus Robin - DevOps Engineer</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #e9ebf0;
}

.container {
    max-width: 1000px;
    margin: 40px auto;
    background: #ffffff;
    padding: 40px;
    box-shadow: 0 0 20px rgba(0,0,0,0.15);
}

h1 {
    text-align: center;
    color: #7b4bb7;
    margin-bottom: 5px;
}

.title {
    text-align: right;
    color: #7b4bb7;
    font-weight: bold;
}

.contact {
    text-align: center;
    margin-bottom: 20px;
    font-size: 14px;
}

.section-title {
    text-align: center;
    color: #7b4bb7;
    font-weight: bold;
    margin-top: 30px;
    padding-bottom: 5px;
    border-bottom: 2px solid #7b4bb7;
}

.job-title {
    font-weight: bold;
}

.date {
    float: right;
    font-weight: bold;
}

.skills-container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.skill-box {
    width: 48%;
    margin-top: 15px;
}

ul {
    margin-top: 5px;
    line-height: 1.6;
}

.projects-list {
    text-align: center;
}

.projects-list ul {
    list-style-position: inside;
    padding: 0;
}

.divider {
    width: 100%;
    height: 2px;
    background-color: #7b4bb7;
    margin: 30px 0;
}

.footer {
    display: flex;
    justify-content: space-between;
}
</style>
</head>

<body>

<div class="container">

<h1>HEBRUS ROBIN</h1>
<div class="title">DEVOPS ENGINEER</div>

<div class="contact">
Ph.no: 9094120699 • email: hebrusr@gmail.com • Royapettah, Chennai-600014<br>
www.linkedin.com/in/hebrus-robin
</div>

<div class="section-title">SUMMARY</div>
<p>
Highly motivated and analytically-driven professional transitioning from Commerce to Cloud Architecture.
AWS Certified Solutions Architect Associate (SAA-C03) with expertise in designing scalable,
cost-optimized, and secure AWS infrastructure (VPC, EC2, S3, IAM).
</p>

<div class="section-title">WORK EXPERIENCE</div>

<p class="job-title">AWS DevOps Engineer - Freelancer
<span class="date">Dec 2024 - Present</span></p>
<ul>
<li>Designed scalable AWS infrastructure using Terraform & CloudFormation.</li>
<li>Managed Amazon EKS clusters with Ingress and Autoscaling.</li>
<li>Implemented monitoring using Prometheus & Grafana.</li>
<li>Automated workflows using Python, Bash & AWS Lambda.</li>
</ul>

<p class="job-title">Relationship Manager - DCB Bank
<span class="date">July 2024 - Dec 2024</span></p>
<ul>
<li>Managed loan servicing and processing operations.</li>
<li>Handled customer relationships and documentation.</li>
<li>Coordinated with legal and credit teams for compliance.</li>
</ul>

<div class="section-title">SKILLS</div>

<div class="skills-container">
<div class="skill-box">
<strong>Cloud</strong>
<ul>
<li>IAM, EC2, S3, VPC, RDS, Lambda</li>
<li>ECS, EKS, ECR, CloudWatch</li>
<li>ALB, NLB, CloudFront, WAF</li>
</ul>
</div>

<div class="skill-box">
<strong>CI/CD</strong>
<ul>
<li>GitHub Actions</li>
<li>GitLab CI/CD</li>
<li>Jenkins</li>
</ul>

<strong>Infrastructure as Code</strong>
<ul>
<li>Terraform</li>
<li>CloudFormation</li>
<li>Ansible</li>
</ul>
</div>

<div class="skill-box">
<strong>Containers</strong>
<ul>
<li>Docker</li>
<li>Kubernetes</li>
<li>Amazon EKS</li>
</ul>
</div>

<div class="skill-box">
<strong>Monitoring</strong>
<ul>
<li>Prometheus</li>
<li>Grafana</li>
</ul>
</div>
</div>

<div class="section-title">PROJECTS</div>

<div class="projects-list">
<ul>
<li>Secure Web Application with High Availability on AWS</li>
<li>Terraform Cloud Infrastructure Automation</li>
<li>Web Gallery Static Website using S3</li>
</ul>
</div>

<!-- 🔥 PURPLE DIVIDER BETWEEN PROJECTS AND CERTIFICATION -->
<div class="divider"></div>

<div class="footer">
<div>
<strong>CERTIFICATION</strong><br>
AWS Certified Solutions Architect (SAA-C03) - 2025
</div>

<div>
<strong>EDUCATION</strong><br>
BBA - Ramakrishna Mission Vivekananda College<br>
2021 - 2024 | CGPA: 7.8
</div>
</div>

</div>

</body>
</html>
HTML

EOF

  tags = {
    Name = "Github-actions"
  }
}