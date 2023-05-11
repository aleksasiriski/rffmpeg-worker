# rffmpeg-worker for jellyfin-rffmpeg
This container can be used for both dedicated boxes (or with [rffmpeg-autoscaler](https://github.com/aleksasiriski/rffmpeg-autoscaler)) and Kubernetes!

### Setup

* The workers only need access to the following directories:
  - `/config/cache` (by default it's `/cache` unless you're using my [Jellyfin](https://github.com/aleksasiriski/rffmpeg-go/pkgs/container/jellyfin-rffmpeg) image)
  - `/config/transcodes`
  - `/config/data/subtitles`

### Kubernetes

On Kubernetes you can use [OpenEBS](https://github.com/openebs/dynamic-nfs-provisioner) to create RWX from RWO volume or [Longhorn](https://longhorn.io) RWX volumes (NFSv4) and mount said paths to Jellyfin host and workers (must be exactly the same mount points!).

Here's a [Helm chart repo with instuctions](https://github.com/aleksasiriski/jellyfin-kubernetes)