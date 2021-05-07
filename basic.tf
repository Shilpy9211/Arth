variable "x" {
	type = string                                     #to define a variable
	default = "shilpy"                               #if value is not coming from any source ,then this will be default value of x
}

output "op" {
	value = "this is test code by ${var.x}"                 #to retrieve value of variable                      
}