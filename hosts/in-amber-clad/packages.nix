{ pkgs, inputs, ... }: {

  nix.settings = {
    substituters = [
      "https://cache.nixos-cuda.org"
      "https://cache.flox.dev"
    ];
    trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
    ];
  };

  environment.systemPackages = with pkgs; [
    # Handbrake
    (writeShellApplication {
      name = "handbrake";
      text = ''
        LD_LIBRARY_PATH=/run/opengl-driver/lib:''${LD_LIBRARY_PATH-} ${pkgs.handbrake}/bin/ghb "$@"
      '';
    })

    qbittorrent
    actiona
  ];
  services.flatpak.packages = [
    "xyz.rust4diva.Rust4Diva"
  ];
}
