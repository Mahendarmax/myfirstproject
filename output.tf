output "website_bucket_name" {
description = "Name (id) of the bucket"
 value = aws_s3_bucket.site.id
}
output "bucket_endpoint" {
description = "Bucket endpoint"
value = aws_s3_bucket.site.website_endpoint
}
output "website_bucket_arn" {
description = "The ARN of the bucket"
value = aws_s3_bucket.bucket_name
}