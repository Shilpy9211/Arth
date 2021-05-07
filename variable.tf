#provider detail


provider "aws" {
	region = "ap-south-1"                     #region need to be specified, even if it is mentioned in profile
	profile = "shilpy"                        #profile we can configure with $aws configure --profile <name>.............aws cli software needed to be installed
}


#launching instance


resource "aws_instance" "os1" {                   #os1 is variable we are declaring, which will contain all the details of created resource
	ami = "ami-068d43a544160b7ef"
	instance_type = "t2.micro"
	tags = {
		Name = "tf os"
	}
}

output "op1" {                                   #from os1 variable, we can retrieve all the values by getting output from it
	value = aws_instance.os1
}

#creating ebs volume in same region as of instance


resource "aws_ebs_volume" "st1" {
	availability_zone = aws_instance.os1.availability_zone                           #ebs volume will be created in same availability zone as of created instance
	size = 10
	tags = {
		Name = "tf ebs"
	}
}

output "op2" {                                                               #here st1 is the same variable, created during creation of ebs volume, this is not the another variable
	value = aws_ebs_volume.st1
}


#attaching created volume to launched instance


resource "aws_volume_attachment" "os_ebs1" {
	device_name = "/dev/sdh"
	instance_id = aws_instance.os1.id
 	volume_id = aws_ebs_volume.st1.id
}

output "op3" {
	value = aws_volume_attachment.os_ebs1
}