{ pkgs, user, home, ... }:

{
  imports = [
    ../../modules/home-manager/default.nix
    ../../modules/home-manager/alacritty.nix
  ];

  home = {
    username = user;
    homeDirectory = home;
  };

  home.file = { };

  home.packages = with pkgs; [ ];
}
