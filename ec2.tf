provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAU34DU4UCHY3TRO7B"
    secret_key = "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"
}

resource "aws_instance" "vpc" {
    ami = "ami-0c1a7f89451184c8b"
    instance_type = "t2.micro"
    key_name = "kubernates"
    vpc_security_group_ids = ["${aws_security_group.hai.id}"]

    tags = {
        Name = "venkatesh"
    }
}

resource "aws_security_group" "hai" {
    name = "this venkatesh"


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
}

output "maruthi" {
  value = aws_instance.vpc.public_ip
}