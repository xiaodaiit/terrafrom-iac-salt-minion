variable "master_instance_number" {
  default = 1
}


variable "minion_instance_number" {
  default = 1
}


variable "region" {
  default = "cn-beijing"
}


variable "master_private_ip" {
  default = ""
  description = "master节点私有ip"
}

variable "master_public_ip" {
  default = ""
  description = "master节点共有ip"
}


variable "role" {
  default = "分组名称"
}

variable "zone" {
  default = "cn-beijing-b"
}

variable "key_name" {
  default = "cloudiac-test-sql-r"
}


variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCX3n6UbQVyVV/o0EY1KPl1l9UDB0uf1u3eN0EAFwqCA70ZXg8gH5EEasv6Tk0snZdA34TI2t1g13N8hD1MWbDQoGjAWeVWbbhDwOPCLz3NIJHt3K9hVv7zkmosfL5whrnfGpGYwCozScNr6UYCD6i1994iJFEoMy3gEcr0udW8RzXfvK6mytBjEEC49EbT6gtPjhwtwayBH1IhU7hBL5+Jacmhw7NnsUYw2KIRPq8bF0fiuaM7okPC2rneuxhAaouEjK1jS98YNhDZDxTD5QSsv4kOo+nyGatbglAHQLyrW9x2pzN4TwGmfVXtrPK+k92bOGulxpT/n2JyuaYgT7KP Key_For_VMware_CentOS"
}

variable "vpc_name" {
}

variable "cidr_block" {
}

variable "sg_name" {
  description = "安全组名称"
}

variable "instance_type" {
  description = "ecs.t5-lc1m1.small"
}

variable "instance_name" {
  description = "计算实例名称"
}

