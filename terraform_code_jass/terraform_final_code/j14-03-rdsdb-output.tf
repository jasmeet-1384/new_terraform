# RDS DB Outputs
output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rdsdb.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rdsdb.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value = module.rdsdb.db_instance_availability_zone
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value = module.rdsdb.db_instance_ca_cert_identifier
}

output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value = module.rdsdb.db_instance_cloudwatch_log_groups
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value = module.rdsdb.db_instance_domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  value = module.rdsdb.db_instance_domain_iam_role_name
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value = module.rdsdb.db_instance_endpoint
}

output "db_instance_engine" {
  description = "The database engine"
  value = module.rdsdb.db_instance_engine
}

