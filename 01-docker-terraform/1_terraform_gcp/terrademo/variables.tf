variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "imposing-vista-416522"
}

variable "region" {
  description = "Project Region"
  default     = "asia-southeast2"
}

variable "location" {
  description = "Project Location"
  default     = "asia-southeast2"
}

variable "bq_dataset_name" {
  description = "My Bigquery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "imposing-vista-416522"
}

variable "gcs_mage_bucket_name" {
  description = "My Storage Bucket for Mage project"
  default     = "imposing-vista-416522-mage-zoomcamp-matt-palmer-3"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

