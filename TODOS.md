# TODOs

## Extend nix flake to other playbooks

Extend the nix flake approach to cover `openclaw.yml`, `claws.yml`, and `webserver.yml`
playbooks. Each would get a home-manager module that adds its specific packages on top
of the base `home.nix`.

**Context:** The current nix setup only reproduces the base role. The claws playbook
installs 5 agent frameworks (OpenClaw, NemoClaw, NanoClaw, MetaClaw, ZeroClaw) with
diverse install methods (npm, git+bun, pip, cargo). NemoClaw requires xl (8 GB) VMs.
The webserver/fileserver playbooks use the docker-app role which would need a nix
equivalent for container management.

**Depends on:** nix base deployment being stable and proven in production.
