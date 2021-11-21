resource "aws_s3_bucket" "remote_s3" {
	bucket = "s3-backend-bucket-1111111"
		
	versioning {
		enabled = true
	}
	
	server_side_encryption_configuration {
		rule{
			apply_server_side_encryption_by_default{
				sse_algorithm = "AES256"
			}
		}
	}
	
	lifecycle {
	      prevent_destroy = true
	}
}

resource "aws_dynamodb_table" "backend_lock" {
	hash_key = "LockId"
	name = "my_dynamodb_table_backend"
	billing_mode = "PAY_PER_REQUEST"
	attribute {
		name = "LockId"
		type = "S"
	}
}
