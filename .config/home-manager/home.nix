{ config, pkgs, ... }:

let
    HOME = builtins.getEnv("HOME");
    symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gerard";
  home.homeDirectory = "/home/gerard";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.bat
    pkgs.cargo
    pkgs.curl
    pkgs.diff-so-fancy
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.git
    pkgs.glibcLocales
    pkgs.lazygit
    pkgs.lua
    pkgs.neovim
    pkgs.nodejs_20
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.ripgrep
    pkgs.starship
    pkgs.util-linux
    pkgs.zellij
    pkgs.zoxide
    pkgs.zsh

    # Install language servers
    pkgs.clang-tools  # clangd, clang-format, clang-tidy
    pkgs.lua-language-server
    pkgs.marksman
    pkgs.nixd
    pkgs.nodePackages.bash-language-server
    pkgs.nodePackages.pyright

    # Install static analyzers
    pkgs.mypy

    # Install linters
    pkgs.ruff

    # Install formatters
    pkgs.beautysh
    pkgs.black
    pkgs.stylua

    # echo "Install debbuggers"
    # TODO

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".gitconfig".source = symlink "${HOME}/dev-env/.gitconfig";
    ".ripgreprc".source = symlink "${HOME}/dev-env/.ripgreprc";
    ".zshrc".source = symlink "${HOME}/dev-env/.zshrc";

    ".config/alacritty".source = symlink "${HOME}/dev-env/.config/alacritty";
    ".config/awesome".source = symlink "${HOME}/dev-env/.config/awesome";
    ".config/home-manager".source = symlink "${HOME}/dev-env/.config/home-manager";
    ".config/kitty".source = symlink "${HOME}/dev-env/.config/kitty";
    ".config/lazygit".source = symlink "${HOME}/dev-env/.config/lazygit";
    ".config/nvim".source = symlink "${HOME}/dev-env/.config/nvim";
    ".config/starship.toml".source = symlink "${HOME}/dev-env/.config/starship.toml";
    ".config/zellij".source = symlink "${HOME}/dev-env/.config/zellij/";
    ".config/zsh".source = symlink "${HOME}/dev-env/.config/zsh";

    "bin".source = symlink "${HOME}/dev-env/bin";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
