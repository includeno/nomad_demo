job "example" {
  datacenters = ["dc1"]

  group "flask-group" {

    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    task "flaskdemo" {
      driver = "docker"

      env = {
        "KEYI" = "password"
      }

      config {
        image = "includeno/flaskdemo:latest"

        ports = ["db"]
      }

      resources {
        cpu    = 500
        memory = 1024
      }

      service {
        name = "flaskdemo-server"
        port = "db"

        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
    network {
      port "db" {
        static = 3000
      }
    }
  }
}
