{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./packages.nix
  ];
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  networking.nameservers = [ "1.1.1.1" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  services.displayManager.gdm.enable = true;
  services.printing.enable = true;
  services.tailscale.enable = true;
  services.udisks2.enable = true;
  services.usbmuxd.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.printing.drivers = [
    pkgs.brlaser
  ];

  
  xdg.autostart.enable = true;
  # Mount SMB Share(s)
  # TODO: Use secrets for authentication
  fileSystems."/mnt/Media" =
    {
      device = "//192.168.86.27/Media";
      fsType = "cifs";
      options = [
        "credentials=/home/zack/.credentials"
        "x-systemd.automount"
        "noauto"
        "x-systemd.requires=tailscaled.serivce"
        "x-systemd.after=tailscale.service"
        "x-systemd.idle-timeout=60"
        "x-systemd.mount-timeout=30"
        "uid=1000,gid=100"
      ];
    };
  users.users.zack = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
    shell = pkgs.zsh;
    # hashedPassword = "$y$j9T$p0U92qd4AG6bvkAqSAkPq.$sEY5Es4qLrpv/xvhXBpDi.NNMwzWbt79HiOEqHJRYp6";
    # packages = with pkgs; [];
  };
  

  services.displayManager.defaultSession = "hyprland";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  system.stateVersion = "26.05"; # Did you read the comment?
  
  # //minipc/shared                           /var/home/shared        cifs    username=yourusername,password=yourpassword,uid=yourusername,gid=yourgroup,x-systemd.automount,x-systemd.requires=tailscaled.service,x-systemd.idle-timeout=60,x-systemd.mount-timeout=30 0 0
}
