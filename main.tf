resource "aws_dynamodb_table" "StudentID" {
  name             = "Students"
  hash_key         = "student-id"
  billing_mode = "PROVISIONED" 
  read_capacity = 10  
  write_capacity = 10

  attribute {
    name ="student-id"
    type = "S"
  }
}