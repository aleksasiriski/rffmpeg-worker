# rffmpeg-worker for jellyfin-rffmpeg
This container can be used for both dedicated boxes (or with [rffmpeg-autoscaler](https://github.com/aleksasiriski/rffmpeg-autoscaler)) and Kubernetes!

### Setup

* The workers only need access to the media and the transcode dir for playing said media (default is `/config/transcodes`).
* It's recommended to also share the `/config/data/subtitles` directory since Jellyfin uses ffmpeg to extract subtitles.

### Kubernetes

On Kubernetes you can use [Longhorn](https://longhorn.io) RWX volumes (NFSv4) and mount said paths to Jellyfin host and workers (must be exactly the same mount points!).

Here's a [Helm chart repo with instuctions](https://github.com/aleksasiriski/jellyfin-kubernetes)