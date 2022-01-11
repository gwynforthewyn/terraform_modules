resource "aws_key_pair" "access_aws" {
  key_name   = "aws_access_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6P7n0GhfoYD5ekj0/KX+lVSDw/Qnkr+hZCEctbDmXe gwyn@patchwork.local"
}
