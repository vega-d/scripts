#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

sudo podman run -d --name=tailscaled -v /var/lib:/var/lib -v /dev/net/tun:/dev/net/tun --network=host --privileged tailscale/tailscale tailscaled

sudo ln -s ./misc/tailscale-loader /usr/local/bin/tailscale-loader
sudo ln -s ./misc/tailscale-loader.service /etc/systemd/system/tailscale-loader.service
sudo systemctl daemon-reload
sudo systemctl enable tailscale-loader
sudo systemctl restart tailscale-loader