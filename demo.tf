variable "compartment_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaaqg3jfw7lpittprwjto6ocbkwf5vopxstw3ifnm7lhvg7bomuj7iq"
}
variable "region" {
    default = "us-ashburn-1"
}

variable "bucket_namespace" {
    default = "devopsdba"
}
variable "bucket_name" {
    default = "resource_manager_demo_bucket"
}

provider "oci" {
    region = var.region
}

resource "oci_objectstorage_bucket" "create_bucket" {
    # required
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = var.bucket_namespace

    # optional
    access_type = "NoPublicAccess" # <---- updated from "ObjectRead"
}

output "new_bucket" {
    value = oci_objectstorage_bucket.create_bucket
}
