# <a href="https://github.com/dmarcoux/go_templates">dmarcoux/go_templates</a>

Templates for common files/configs in [Go](https://go.dev/) projects.

## How to Use This Template

1. Create a new repository based on this repository:

- Go to this [repository's page](https://github.com/dmarcoux/go_templates),
  click on the `Use this template` button and follow instructions.

  *OR*

- With [GitHub's CLI](https://github.com/cli/cli), run:

  ```bash
  gh repo create NEW_REPOSITORY_NAME --template=dmarcoux/go_templates --clone --private/--public
  ```

2. Search for `CHANGEME` in the newly created repository to adapt it to the
   project's needs.

3. Adapt this README to the project. This complete section can be deleted...

## nix-shell for Go

Reproducible development environment for Go projects which relies on
[Nix](https://github.com/NixOS/nix), a purely functional and cross-platform
package manager.

**Start development environment:**

```bash
nix-shell --pure
```
