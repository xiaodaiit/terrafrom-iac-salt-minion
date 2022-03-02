
provider "alicloud" {
  region = "cn-beijing"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
}

resource "alicloud_vswitch" "default" {
  vpc_id     = alicloud_vpc.default.id
  cidr_block = var.cidr_block
  zone_id    = var.zone
}

resource "alicloud_security_group" "default" {
  name   = var.sg_name
  vpc_id = alicloud_vpc.default.id
}


resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_ecs_key_pair" "default" {
  key_pair_name = var.key_name
  public_key    = var.public_key
}

resource "alicloud_instance" "salt-minion" {
#  count                = var.minion_instance_number
  count                = 3

  availability_zone    = var.zone
  security_groups      = alicloud_security_group.default.*.id
  instance_type        = var.instance_type
  system_disk_category = "cloud_efficiency"
  image_id             = "centos_7_9_x64_20G_alibase_20211027.vhd"
  instance_name        = var.instance_name

  key_name   = alicloud_ecs_key_pair.default.key_pair_name
  vswitch_id = alicloud_vswitch.default.id
  user_data = data.cloudinit_config.foo.rendered


  internet_max_bandwidth_out = 100
}


//salt 初始化yum源 并安装salt-minion
data "template_file" "cloud_init_tpl" {
  template = file("config-salt.tpl")
  vars = {
    role      = var.role
  }
}

////生成clound init模板文件 yaml格式
data "cloudinit_config" "foo" {
  gzip = false
  base64_encode = false

 part {
    content_type = "text/cloud-config"
    content = data.template_file.cloud_init_tpl.rendered
    filename = "config_salt.yaml"
  }
}




