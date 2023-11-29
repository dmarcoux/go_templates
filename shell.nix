# To ensure this nix-shell is reproducible, we pin the packages index to a commit SHA taken from a channel on https://status.nixos.org/
# This commit is from nixpkgs-unstable, it's somewhere between NixOS 23.05 and the following version
with (import (fetchTarball https://github.com/NixOS/nixpkgs/archive/5b528f99f73c4fad127118a8c1126b5e003b01a9.tar.gz) {});

mkShell {
  buildInputs = [
    go_1_20
    # Various tools and packages mostly for static analysis of Go programs - https://go.googlesource.com/tools
    gotools
    # Task runner / build tool that aims to be simpler and easier to use than GNU Make - https://taskfile.dev/
    go-task
    # Debugger for Go
    delve
    # Linters for Go - https://golangci-lint.run/
    golangci-lint
    # Locales
    glibcLocales
    # Install certificates to prevent SSL errors
    cacert
  ];

  shellHook = ''
    # Set LANG for locales, otherwise it is unset when running "nix-shell --pure"
    export LANG="C.UTF-8"

    # Remove duplicate commands from Bash shell command history
    export HISTCONTROL=ignoreboth:erasedups

    # Keep Go workspace data in the project (Be sure to ignore this directory in `.gitignore`)
    export GO_PATH="$PWD/.gopath"
    mkdir -p "$GO_PATH"
  '';

  # Without this, there are warnings about LANG, LC_ALL and locales.
  # Many tests fail due those warnings showing up in test outputs too...
  # This solution is from: https://gist.github.com/aabs/fba5cd1a8038fb84a46909250d34a5c1
  LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
}
