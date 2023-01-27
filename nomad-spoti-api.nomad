job "spoti-api" {
  meta {
    run_uuid = "${uuidv4()}"
  }
  datacenters = ["dc1"]
  type = "service"
  group "api" {
    count = 1
    network { mode = "bridge" }
    task "demo-service" {
      driver = "docker"
      config {
        image = "nginxdemos/hello"
      }
    }
    task "tailscale" {
      driver = "docker"
      config {
        image = "tailscale/tailscale"
        volumes = [
          "/var/lib:/var/lib",
          "/dev/net/tun:/dev/net/tun"
        ]
        network_mode = "host"
        cap_add = ["net_admin", "net_raw"]
      }
      env {
        TS_AUTH_KEY = "${TS_AUTH_KEY}"
      }
    }
  }
}

