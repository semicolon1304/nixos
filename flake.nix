{
  description = "WHAT THE FUCK IS A FLAKE (to the tune of 'WHAT THE FUCK IS A KILOMETER')";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    iloader = {
      url = "github:nab138/iloader";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    distro-grub-themes = {
      url = "github:AdisonCavani/distro-grub-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nixos-hardware
    , nix-flatpak
    , nix-vscode-extensions
    , ...
    } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        forward-onto-dawn = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs system nix-vscode-extensions; };
          modules = [
            ./hosts/forward-onto-dawn
            home-manager.nixosModules.default
            {
              home-manager = {
                # inherit pkgs;
                useGlobalPkgs = false;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs pkgs; };
                users.zack = ./home/zack;
              };
            }
            nixos-hardware.nixosModules.framework-16-7040-amd
            nix-flatpak.nixosModules.nix-flatpak
            inputs.distro-grub-themes.nixosModules.${system}.default
          ];
        };
        in-amber-clad = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs system; };
          modules = [
            ./hosts/in-amber-clad
            nix-flatpak.nixosModules.nix-flatpak
            inputs.distro-grub-themes.nixosModules.${system}.default
          ];
        };
      };

      # homeConfigurations = {
      #   zack = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     useGlobalPkgs = true;
      #     useUserPackages = true;
      #     extraSpecialArgs = { inherit inputs; };
      #     users.zack = ./home/zack ;
      #   };
      # };
    };
}
