resource "aws_s3_bucket" "s3_bucket" {
  count = length(var.s3_bucket)

  bucket = var.s3_bucket[count.index].bucket
  dynamic "versioning" {
    for_each = var.s3_bucket[count.index].versioning
    content {
      enabled = versioning.value.enabled
    }
  }
}