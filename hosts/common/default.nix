{ config, lib, pkgs, inputs, ... }:
let
  secrets_path = toString inputs.nixos-secrets;
in
{
  imports = [
    ./packages.nix
  ];

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
  time.hardwareClockInLocalTime = true;

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
  services.openssh.generateHostKeys = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.printing.drivers = [
    pkgs.brlaser
  ];
  virtualisation.spiceUSBRedirection.enable = true;


  xdg.autostart.enable = true;
  # Mount SMB Share(s)
  # TODO: Use secrets for authentication
  fileSystems."/mnt/Media" =
    {
      device = "//192.168.86.27/Media";
      fsType = "cifs";
      options = [
        # "credentials=${config.sops.secrets.smb_credentials.path}"
        "credentials=/home/zack/.credentials"
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=60"
        "x-systemd.mount-timeout=30"
        "x-systemd.device-timeout=5s"
        "uid=1000,gid=100"
      ];
    };
  users = {
    mutableUsers = false; # Needed to set password declaratively

    users.zack = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets.zack_passwd.path;
      # packages = with pkgs; [];
    };
    # users.test = {
    #   isNormalUser = true;
    #   extraGroups = [ "wheel" "networkmanager" ];
    #   shell = pkgs.zsh;
    #   hashedPasswordFile = config.sops.secrets.zack_passwd.path;
    #   # packages = with pkgs; [];
    # };
  };

  sops = {
    defaultSopsFile = "${secrets_path}/secrets.yaml";
    age = {
      # sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      # generateKey = true;
      keyFile = "/var/lib/sops-nix/key.txt";
    };
    secrets = {
      zack_passwd = {
        neededForUsers = true;
      };
      # smb_credentials = {};
      # forward-onto-dawn_github_ssh = {};
    };
  };



  services.displayManager.defaultSession = "hyprland";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.EDITOR = "nvim";
  system.stateVersion = "26.05"; # Did you read the comment?

  # //minipc/shared                           /var/home/shared        cifs    username=yourusername,password=yourpassword,uid=yourusername,gid=yourgroup,x-systemd.automount,x-systemd.requires=tailscaled.service,x-systemd.idle-timeout=60,x-systemd.mount-timeout=30 0 0
}
