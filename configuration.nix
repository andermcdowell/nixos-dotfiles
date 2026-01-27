{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services.getty = {
      autologinUser = "milk";
      autologinOnce = true;
  };

  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && niri
  '';

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixBox"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.milk = {
    isNormalUser = true;
    description = "Andrew McDowell";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
	    vintagestory
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    ffmpeg
    ripgrep
    fzf
    fastfetch
    btop
    playerctl
    waybar
    nvidia-modprobe
    neovim
    davinci-resolve
    wl-clipboard-rs
    unzip

    git
    glib
    gcc
    go
    python3
    odin
    nodejs
    dotnet-sdk
    cargo

    steam-run
    curl
    discord
    obs-studio
    tidal-hifi
    bat
    tmux
    lazygit
    lazydocker
    rofi
    alacritty
    vscode
    nautilus
    gnumake
    gopls
    ly
    btop
    pavucontrol
    docker
    docker-compose
    pavucontrol
    xdg-desktop-portal-wlr
    google-chrome
    mangohud
    starship

    xwayland
    xwayland-satellite
  ];

  hardware = {
      graphics.enable = true;
      nvidia = {
          modesetting.enable = true;
          open=true;
      };
      bluetooth.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };
  services.tuned.enable = true;

  xdg.portal.wlr.enable = true;

  fonts = {
      packages = with pkgs; [
        nerd-fonts.monaspace
        noto-fonts-cjk-sans
      ];

      fontconfig = {
          enable = true;
          defaultFonts = {
            monospace = ["MonaspiceAr Nerd Font Mono"];
          };
      };
  };

  programs = {
      nix-ld.enable = true;
      niri.enable = true;
      xwayland.enable = true;
      wireshark.enable = true;
      
      steam = {
          enable = true;
          remotePlay.openFirewall = true;
          localNetworkGameTransfers.openFirewall = true;
      };
      gamemode.enable = true;
  };
  virtualisation.docker.enable = true;

  environment.variables = {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      OZONE_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
  };

  # Automatic Updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # Cleanup Old Nix Versions
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment?

}
