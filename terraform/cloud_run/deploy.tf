variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
  default = "europe-west2"
}

variable "image" {
  description = "Container Image"
  default = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "service_name" {
  description = "Name of the Cloud Run Service"
  default = "hello-world-terraform-style"
}

# Configure GCP Project
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create and deploy service (container) to Cloud Run
resource "google_cloud_run_service" "my-service" {
  name     = var.service_name
  location = var.region

  metadata {
    annotations = {
      "autoscaling.knative.dev/maxScale"      = "1000"
      "run.googleapis.com/client-name" = "terraform"
    }
  }

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }


}

# Public Access to the service
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}

# Enable Public Access to the service
resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.my-service.location
  project     = google_cloud_run_service.my-service.project
  service     = google_cloud_run_service.my-service.name


  policy_data = data.google_iam_policy.noauth.policy_data
}

# Return the URL
output "url" {
  value = "${google_cloud_run_service.my-service.status[0].url}"
}