{ pkgs, inputs, pkgs-unstable, ... }: {
  # nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];

  programs.steam.enable = true;
  programs.hyprland.enable = true; # Move to hyprland.nix
  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.zsh.ohMyZsh.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/zack/nixos"; # sets NH_OS_FLAKE variable for you
  };
  fonts.packages = with pkgs; [
    source-sans
  ];

  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  environment.systemPackages = with pkgs; [
    # TODO: Fix categorizations

    # Essentials
    kitty
    nautilus
    nautilus-open-any-terminal
    sushi # Preview for nautilus
    fastfetch
    home-manager
    brightnessctl
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default


    # Terminal Utilities
    btop
    pokemon-colorscripts
    micro
    file
    killall
    busybox

    # Dangerous Hacking Tools
    nmap
    burpsuite
    hashcat
    zbar
    imhex
    netcat


    # Programming
    # Languages
    python3
    gcc
    dotnet-aspnetcore
    jdk
    rustc
    cargo
    ruby

    # IDEs / Language Servers
    jetbrains.rider
    #jetbrains.idea-oss
    #jetbrains.rust-rover
    nixd
    ruby-lsp # This may be doing nothing currently
    nixpkgs-fmt
    android-tools

    # Games
    prismlauncher
    archipelago
    poptracker
    protontricks
    lumafly
    dolphin-emu

    # ...Networking?
    proton-vpn
    tailscale
    dnsmasq # Needed for vm
    qbittorrent
    filezilla

    # A/V?
    # TODO: come up with a better name for this category
    evince # Document viewer
    loupe # Image viewer
    mpv # Video player
    ffmpeg
    gapless # Maybe just for in-amber-clad?
    calibre
    imagemagick
    libreoffice-fresh

    # Communication
    vesktop
    teams-for-linux

    # Misc
    pkgs-unstable.iloader
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprshot
    obsidian
    bleachbit
    wine
    winetricks
    swtpm # TPM for windows vm
    nixos-icons
    spice-gtk
    orca-slicer
    sops
    age
    ssh-to-age
    # cifs-utils
    plasticity
    picard
  ];
  # Move some of this to per-system packages.nix
  services.flatpak.packages = [
    "org.freac.freac"
  ];
}
