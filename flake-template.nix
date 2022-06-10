{
  description = "Nix Darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-21.11-darwin";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  }: let
    username = "@@USER@@";
    home = "@@HOME@@";
    hostname = "@@HOSTNAME@@";
    system = "@@SYSTEM@@";
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit system username;
      configuration = import ./home.nix;
      homeDirectory = home;

      # Update the state version as needed.
      # See the changelog here:
      # https://nix-community.github.io/home-manager/release-notes.html#sec-release-21.05
      stateVersion = "21.11";
    };
  };
}
