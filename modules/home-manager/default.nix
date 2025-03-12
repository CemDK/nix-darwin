{ config, pkgs, ... }:

{

  # Common across all machines and users
  imports = [ ./eza.nix ./fzf.nix ./vim.nix ./zsh.nix ];

  home.stateVersion = "21.11";

  home.packages = with pkgs; [
    bat
    curl
    fd
    fzf
    gh
    git
    htop
    jq
    lazygit
    neofetch
    ripgrep
    tldr
    tmux
    unzip
    wget
    vim
    zsh

    # Code
    lua
    luajitPackages.luarocks
    nodejs_23
    rustup
    typescript

    ###################
    # for nvim
    tree-sitter
    # formatting / linting
    nodePackages.prettier
    statix # nix linter
    nixd
    nixfmt-classic
    # Let mason do these
    # eslint
    # eslint_d
    # lua-language-server
    # nodePackages.vscode-json-languageserver
    # tailwindcss-language-server
    # typescript-language-server
  ];

  home.file = {
    ".local/scripts/ready-tmux".source =
      ../../modules/home-manager/scripts/ready-tmux;

    ".local/scripts/tmux-sessionizer".source =
      ../../modules/home-manager/scripts/tmux-sessionizer;
  };

  programs = {
    # home-manager.enable = true;
    git.enable = true;
  };

  xdg = {
    enable = true;

    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    cacheHome = "${config.home.homeDirectory}/.cache";
  };

  # TODO: look into direnv
  # programs.direnv = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   nix-direnv.enable = true;
  # };
}
