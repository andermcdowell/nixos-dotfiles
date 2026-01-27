{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      grep = "grep --color=auto";
      ll = "ls -l";
      la = "ls -lAtr";
      cat = "bat";
      ta = "tmux a";
      ".." = "cd ..";
      update = "nixos-rebuild --sudo switch --flake ~/nixos-dotfiles#nixBox";
      upgrade = "sudo nixos-rebuild --sudo switch --upgrade --flake ~/nixos-dotfiles#nixBox";
    };

    # Your environment variables
    initExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
      eval "$(starship init bash)"
      eval "fastfetch"
    '';

  };

}
