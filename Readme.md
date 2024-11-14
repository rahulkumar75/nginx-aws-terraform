# AWS Infrastructure for NGINX Server Deployment using Terraform

This project sets up a scalable AWS infrastructure to deploy an NGINX web server on an EC2 instance, utilizing Terraform for infrastructure as code (IaC). It includes configurations for VPC, subnets, security groups, and necessary networking components, creating a secure and accessible environment for the web server.

## Features

- **Custom VPC Setup**: Creates a VPC with public and private subnets to ensure secure segmentation of resources.
- **EC2 Instance with NGINX**: Deploys an EC2 instance in the public subnet with NGINX installed and automatically started, allowing immediate access to the web server.
- **Security Groups**: Configures security rules to allow inbound HTTP traffic on port 80 and unrestricted outbound traffic for secure server communication.
- **Internet Gateway and Routing**: Sets up an Internet Gateway and routing table to enable internet access for the public subnet.

## Infrastructure Diagram

```
AWS VPC
├── Public Subnet
│   ├── EC2 Instance (NGINX Server)
│   └── Security Group (Allow HTTP Inbound Traffic)
└── Private Subnet
```

## Files Overview

- **main.tf**: Specifies the required AWS provider version.
- **providers.tf**: Configures the AWS provider.
- **vpc.tf**: Defines the VPC, subnets, Internet Gateway, and route tables.
- **security_group.tf**: Configures the security group to control access.
- **ec2.tf**: Deploys the EC2 instance with NGINX installed and started.

## Prerequisites

- Terraform 1.0+
- AWS CLI configured with credentials and region
- Access to create resources in AWS (IAM role with permissions for EC2, VPC, and related resources)

## Setup Instructions

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/nginx-aws-terraform.git
    cd nginx-aws-terraform
    ```

2. **Initialize Terraform**:
    ```bash
    terraform init
    ```

3. **Apply the Terraform Configuration**:
    ```bash
    terraform apply
    ```

4. **Access the NGINX Web Server**:
   Once deployment is complete, navigate to the public IP address of the EC2 instance in your browser to view the NGINX welcome page.

## Outputs

- **Web Server URL**: The public URL of the NGINX server is provided as an output upon successful deployment.

## Cleanup

To delete all resources and avoid unnecessary charges:
```bash
terraform destroy
```

---

## Technologies Used

- **Terraform**: Infrastructure as Code
- **AWS EC2**: Virtual server for NGINX
- **AWS VPC**: Isolated network environment
- **NGINX**: Web server setup and deployment

---

This README provides a structured overview of the project and instructions for setup.