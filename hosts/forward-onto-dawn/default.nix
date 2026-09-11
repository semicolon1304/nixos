{ config, lib, pkgs, inputs, prev, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  boot.loader.grub.device = "nodev";
  distro-grub-themes = {
    enable = true;
    theme = "framework";
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
  networking.hostName = "forward-onto-dawn";
  

  hardware.amdgpu = {
    opencl.enable = true;
    zluda.enable = true;
    overdrive.enable = true;
  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # boot.kernelParams = [ "button.lid_init_state=open" ];
  services.logind.settings.Login = {
  HandleLidSwitch = "suspend";
  HandleLidSwitchExternalPower = "lock";
  HandleLidSwitchDocked = "ignore";
};

  # Services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  # services.pulseaudio.enable = true;
  services.libinput.enable = true; # Touchpad
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
}
