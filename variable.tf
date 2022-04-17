variable "elb_name" {
  type        = string
  description = ""
  default     = "foobar-terraform-elb"
}

variable "availability_zones" {
  type        = list(string)
  description = "(optional) describe your variable"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "instance_port" {
  type        = number
  description = "(optional) describe your variable"
  default     = 8000
}

variable "instance_protocol" {
  type        = string
  description = "(optional) describe your variable"
  default     = "http"
}

variable "lb_port" {
  type        = number
  description = "(optional) describe your variable"
  default     = 80
}

variable "lb_protocol" {
  type        = string
  description = "(optional) describe your variable"
  default     = "http"
}

variable "healthy_threshold" {
  type        = number
  description = "(optional) describe your variable"
  default     = 2
}

variable "unhealthy_threshold" {
  type        = number
  description = "(optional) describe your variable"
  default     = 2
}

variable "timeout" {
  type        = number
  description = "(optional) describe your variable"
  default     = 3
}

variable "target" {
  type        = string
  description = "(optional) describe your variable"
  default     = "HTTP:8000/"
}

variable "interval" {
  type        = number
  description = "(optional) describe your variable"
  default     = 30
}

variable "cross_zone_load_balancing" {
  type        = bool
  description = "(optional) describe your variable"
  default     = true
}

variable "idle_timeout" {
  type        = number
  description = "(optional) describe your variable"
  default     = 400
}

variable "connection_draining" {
  type        = bool
  description = "(optional) describe your variable"
  default     = true
}

variable "connection_draining_timeout" {
  type        = number
  description = "(optional) describe your variable"
  default     = 400
}

variable "tags" {
  type        = string
  description = "(optional) describe your variable"
  default     = "env"
}

variable "region" {
  type        = string
  description = "(optional) describe your variable"
  default     = "us-east-2"
}

variable "bucket_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "force_destroy" {
  type        = bool
  description = "(optional) describe your variable"
}
