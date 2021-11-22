variable "server_type" {
    description = "define server type"
    type = string
    default = "t2.micro"
}

variable "ami" {
    description = "os"
    type = string
    default = "ami-05f7491af5eef733a"
}

variable "pub_key" {
    description = "home pc pub key"
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzR81XbiR3IOW86ZbCI85ZDvlUhmIVIQX20geIdVkTrDa9nCMvGMl4qbmdkTEvQyQeiC2/pl1uKo4k3dz2T0lvPoxxKUS1dS8k8Dc5svIbyX7GQAKuwAGl+Q+CvcGgd8oVO86WjRYD0uxsTAotqiB0k/MKwu5U0U+1TOChPvLIvEfqKsIN8nGXZCovfIdsKtAXRmqJo1gtMJkPZVDAp8kQ7anUTZTamE4/LmgHCgNrB/8zams5rNjMg4PWomJSt0ScoSuWBEa00a6U2nGieN1qSlSEW6A5CKiiauAoQ/OObBxzvCrHs9d73NLJU6ncVlNzeIPoiWaTOWzv38GVAdsabO/Jt0GbmIrLXsv9+Sz7Gw2jgunoU7NvQo5BAuahkTThzZtbhC8W8iLeWipAUE/7GdF96jGsae0rc4fEzAbgcVVL+InqOjmh4E1ocVZbpg0lNs5bDitvfkPx11rht986r26+q/Ji3k7HBysNiadtrsd+G+xEwvCtreqSYEDe7wU= liquid@DESKTOP-LVEV8LN"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "CIDR for VPC"
}

variable "tenancy" {
    type = string
    default = "default"
    description = ""
}

variable "enable_dns_support" {
    type = string
    default = true
    description = ""
}

variable "enable_dns_hostnames" {
    type = string
    default = true
    description = ""
}

variable "vpc_name" {
    type        = string
    default     = "main"
    description = ""
}

variable "bucket_name" {
    type = string
    default = "srdela-bucket"
    description = ""
}

variable "domain_name" {
    type = string
    default = "srdela.xyz"
    description = ""
}

variable "lb_group01" {
    type = string
    default = "target-group01"
    description = "group for loadbalancer"
}
