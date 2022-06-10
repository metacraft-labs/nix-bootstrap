{
  config,
  pkgs,
  ...
}: {
  # List of packages to be installed in the user profile:
  home.packages = [
  ];

  # Program modules that apply extra configuration to programs,
  # in addition to installing them in the user profile:
  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish.enable = true;
  programs.direnv.enable = true;
  programs.home-manager.enable = true;
}
