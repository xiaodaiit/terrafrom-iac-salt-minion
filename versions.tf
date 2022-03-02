terraform {
  required_providers {
//    salt = {
//      source = "dmacvicar/salt"
//      version = "0.0.2"
//    }
    ansible = {
      source = "idcos/ansible"
      version = "1.0.0"
    }
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.124.3"
   }
  }
}

