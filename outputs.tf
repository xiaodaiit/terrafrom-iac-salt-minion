
//output "master_private_ip" {
//  value = alicloud_instance.salt-master.*.private_ip
//}
//
//output "master_public_ip" {
//  value = alicloud_instance.salt-master.*.public_ip
//}

output "minion_public_ip" {
  value = alicloud_instance.salt-minion.*.public_ip
}

output "minion_private_ip" {
  value = alicloud_instance.salt-minion.*.private_ip
}

