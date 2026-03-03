data "aws_vpc" "default" {
  default = true
}
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.inatance_type
  key_name = var.key_name
  
  vpc_security_group_ids = [aws_security_group.default_sg]
  associate_public_ip_address = true 

   user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hebrus Robin - Resume</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: #f4f4f9;
    }

    .container {
        display: flex;
        max-width: 1100px;
        margin: 40px auto;
        background: #ffffff;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        border-radius: 12px;
        overflow: hidden;
    }

    .left {
        width: 35%;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: white;
        padding: 30px;
    }

    .left h1 {
        margin-bottom: 5px;
        font-size: 28px;
    }

    .left p {
        margin: 5px 0;
        font-size: 14px;
    }

    .section-title {
        margin-top: 30px;
        font-weight: bold;
        font-size: 16px;
        border-bottom: 2px solid rgba(255,255,255,0.5);
        padding-bottom: 5px;
    }

    .left ul {
        padding-left: 18px;
        font-size: 14px;
    }

    .right {
        width: 65%;
        padding: 40px;
    }

    .right h2 {
        color: #6a11cb;
        margin-bottom: 10px;
    }

    .job-title {
        font-weight: bold;
        color: #333;
    }

    .date {
        font-size: 13px;
        color: gray;
    }

    .right ul {
        padding-left: 18px;
    }

    .project-box {
        background: #f3eaff;
        padding: 12px;
        border-left: 4px solid #6a11cb;
        margin-bottom: 10px;
        border-radius: 6px;
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }
        .left, .right {
            width: 100%;
        }
    }
</style>
</head>
<body>

<div class="container">

    <!-- LEFT SIDE -->
    <div class="left">
        <h1>HEBRUS ROBIN</h1>
        <p><strong>Cloud & DevOps Engineer</strong></p>
        <p>📞 9094120699</p>
        <p>📧 hebrusr@gmail.com</p>
        <p>📍 Chennai, India</p>
        <p>🔗 linkedin.com/in/hebrus-robin</p>

        <div class="section-title">Certification</div>
        <p>AWS Certified Solutions Architect – Associate (SAA-C03) – 2025</p>

        <div class="section-title">Cloud Skills</div>
        <ul>
            <li>EC2, S3, VPC, IAM</li>
            <li>RDS, Lambda, EKS, ECS</li>
            <li>CloudWatch, ALB, NLB</li>
            <li>WAF, KMS, CloudFront</li>
        </ul>

        <div class="section-title">DevOps</div>
        <ul>
            <li>GitHub Actions</li>
            <li>GitLab CI/CD</li>
            <li>Jenkins</li>
            <li>Terraform</li>
            <li>CloudFormation</li>
            <li>Ansible</li>
        </ul>

        <div class="section-title">Containers</div>
        <ul>
            <li>Docker</li>
            <li>Kubernetes</li>
            <li>Amazon EKS</li>
        </ul>

        <div class="section-title">Monitoring</div>
        <ul>
            <li>Prometheus</li>
            <li>Grafana</li>
        </ul>
    </div>

    <!-- RIGHT SIDE -->
    <div class="right">

        <h2>Professional Summary</h2>
        <p>
            AWS Certified Solutions Architect Associate with strong expertise in designing scalable,
            secure, and cost-optimized cloud infrastructure. Experienced in Terraform, Kubernetes,
            and CI/CD automation. Passionate about building reliable DevOps pipelines and
            high-availability architectures.
        </p>

        <h2>Work Experience</h2>

        <div>
            <div class="job-title">AWS DevOps Engineer – Freelancer</div>
            <div class="date">Jan 2025 – Present</div>
            <ul>
                <li>Designed scalable AWS infrastructure using Terraform.</li>
                <li>Built and managed Amazon EKS clusters.</li>
                <li>Implemented monitoring with Prometheus & Grafana.</li>
                <li>Automated workflows using Python, Bash & Lambda.</li>
            </ul>
        </div>

        <br>

        <div>
            <div class="job-title">Relationship Manager – DCB Bank</div>
            <div class="date">July 2024 – Dec 2024</div>
            <ul>
                <li>Managed loan processing & compliance.</li>
                <li>Handled customer relationships and documentation.</li>
                <li>Coordinated with legal and credit teams.</li>
            </ul>
        </div>

        <h2>Projects</h2>

        <div class="project-box">
            <strong>Secure Web Application with High Availability on AWS</strong>
        </div>

        <div class="project-box">
            <strong>Terraform Cloud Infrastructure Automation</strong>
        </div>

        <div class="project-box">
            <strong>Web Gallery Static Website using Amazon S3</strong>
        </div>

        <h2>Education</h2>
        <p><strong>BBA – Bachelor of Business Administration</strong></p>
        <p>Ramakrishna Mission Vivekananda College (2021 – 2024) | CGPA: 7.8</p>

    </div>

</div>

</body>
</html> /var/www/html/index.html
              EOF

  tags = {
    Name = "Github-actions"
  }
}