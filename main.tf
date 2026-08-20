terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# הגדרת הפרובידרון (בלי הגדרות מיוחדות, הוא יודע לגשת לדוקר המקומי)
provider "docker" {}

# 1. שלב הורדת ה-Image (בדומה ל-docker pull)
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. שלב הרמת הקונטיינר בפועל (בדומה ל-docker run)
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "my-first-tf-container"

  # ניתוב פורטים: פורט 8000 ב-Codespace יפנה לפורט 80 בתוך הקונטיינר
  ports {
    internal = 80
    external = 8000
  }
}
