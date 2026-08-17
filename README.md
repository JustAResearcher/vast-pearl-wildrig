# Vast Pearl WildRig idle job

Minimal NVIDIA container for running WildRig Multi as a Vast.ai host default job.
The image is intentionally configuration-free: pool, payout address, and worker
name are supplied as Vast default-job arguments.

WildRig 0.50.1 is fetched from the maintainer's GitHub release and pinned to
SHA-256 `9f22e6291dbb4ec922d9698828afcf28502b8ffff9db83f52ee3d56475f66317`.
The workflow publishes the Linux/amd64 image to
`ghcr.io/justaresearcher/vast-pearl-wildrig-0501:0.50.1`.
The verified multi-platform manifest is pinned as
`ghcr.io/justaresearcher/vast-pearl-wildrig-0501@sha256:b2aa2314f0412c3a186edc26cc13bae21279600bd4738e49f7d2f10a869c1fa8`.

Example arguments:

```text
--algo pearlhash --url pool.pearlhash.xyz:9000 --user PAYOUT.WORKER --pass x --print-time 10
```

Vast.ai owns the lifecycle of a default job. It runs on an available GPU and is
preempted for a higher-priority rental. Do not run a separate host-level GPU
miner alongside this container.
