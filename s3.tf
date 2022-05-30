resource "aws_s3_bucket" "website" {
 bucket = "${var.website_bucket_name}"
acl = "public-read"
 policy = <<EOF
{
 "Version": "2008-10-17",
"Statement": [
{
"Sid": "PublicReadGetObject",
"Effect": "Allow",
"Principal": {
 "AWS": "*"
},
"Action": "s3:GetObject",
"Resource": "arn:aws:s3:::${var.website_bucket_name}/*"
}
]
}
EOF
website {
index_document = "index.html"
 error_document = "error.html"
}
}
resource "aws_s3_bucket_object" "object1" {
for_each = fileset("myfiles/", "*")
bucket = "mys3staticwebsiteaaic"
key = each.value
source = "myfiles/${each.value}"
etag = filemd5("myfiles/${each.value}")
}