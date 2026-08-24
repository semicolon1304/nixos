{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  boot.loader.grub.device = "nodev";
  distro-grub-themes = {
    enable = true;
    theme = "asus-rog";
  };

  # networking.networkmanager.enable = true;
  # services.openssh = {
  #   enable = true;
  #   openFirewall = true;
  #   settings = {
  #     PasswordAuthentication = false;
  #     KbdInteractiveAuthentication = false;
  #     PermitRootLogin = "no";
  #     AllowUsers = [ "myUser" ];
  #     MaxAuthTries = 3;
  #     PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
  #   };
  # };
  networking.hostName = "in-amber-clad";

  # Graphics 
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = true;
    #   powerManagement.finegrained = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  # CUDA
  
  nixpkgs.config.cudaSupport = true;

  specialisation = {
    zack.configuration = {
      services.desktopManager.gnome.enable = true;
    };
  };

  # Services
  services.avahi.enable = true;
  services.wivrn = {
    enable = true;
    steam.enable = true;
    steam.importOXRRuntimes = true;
    openFirewall = true;
    autoStart = true;
  };
}
