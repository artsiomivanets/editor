packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "editor-cloud" {
  project_id = "my-cloud-321114"
  source_image = "ubuntu-2004-focal-v20210720"
  zone = "europe-west3-a"
  disk_size = 10
  machine_type = "e2-micro"
  ssh_username = "artem"
  image_name = "editor"
}

build {
  sources = ["sources.googlecompute.editor-cloud"]
  provisioner "ansible" {
    playbook_file   = "./cloud.yml"
  }
}
