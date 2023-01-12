# rffmpeg-worker for jellyfin-rffmpeg
This container can be used for both dedicated boxes (or with [hcloud-rffmpeg](https://github.com/aleksasiriski/hcloud-rffmpeg)) and Kubernetes!

### Setup

* The workers only need access to the media and the transcode dir for playing said media (default is `/config/transcodes`).
* It's recommended to also share the `/config/data/subtitles` directory since Jellyfin uses ffmpeg to extract subtitles.

### Kubernetes

On Kubernetes you can use [Longhorn](https://longhorn.io) RWX volumes (NFSv4) and mount the said paths to Jellyfin host and workers (must be exactly same mount points!).

Here's an example [deployment](https://github.com/aleksasiriski/rffmpeg-worker/blob/main/Kubernetes) of workers. Then just add it as a rffmpeg host:

```bash
kubectl exec -n jellyfin jellyfin-0 -- rffmpeg add --name rffmpeg-workers rffmpeg-workers.jellyfin.svc.cluster.local
```
