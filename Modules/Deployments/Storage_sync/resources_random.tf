# Create random id for unique vault name
resource "random_id" "id" {
  byte_length = 6
}