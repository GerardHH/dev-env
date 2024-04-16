{
  config,
  pkgs,
  lib,
  ...
}: let
  nixgl = import <nixgl> {};
  nixGLWrap = pkg:
    pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
      mkdir $out
      ln -s ${pkg}/* $out
      rm $out/bin
      mkdir $out/bin
      for bin in ${pkg}/bin/*; do
          wrapped_bin=$out/bin/$(basename $bin)
          echo "exec ${lib.getExe' nixgl.auto.nixGLDefault "nixGL"} $bin \$@" > $wrapped_bin
          chmod +x $wrapped_bin
      done
    '';
  HOME = builtins.getEnv "HOME";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gerard";
  home.homeDirectory = "/home/gerard";

  home.stateVersion = "23.11"; # Can introduce breaking changes if changed

  home.packages = [
    # (nixGLWrap pkgs.alacritty) disabled until nixgl is fixed
    pkgs.bat
    pkgs.cargo
    pkgs.curl
    pkgs.delta
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.git
    pkgs.glibcLocales
    pkgs.lazygit
    pkgs.lua
    pkgs.navi
    pkgs.neovim
    pkgs.nodejs_20
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.ripgrep
    pkgs.starship
    pkgs.tmux
    pkgs.tree-sitter # Used by nvim-treesitter
    pkgs.util-linux
    pkgs.zoxide
    pkgs.zsh

    # Install language servers
    pkgs.clang-tools # clangd, clang-format, clang-tidy
    pkgs.cmake-language-server
    pkgs.lua-language-server
    pkgs.marksman
    pkgs.nixd
    pkgs.nodePackages.bash-language-server
    pkgs.nodePackages.pyright
    pkgs.ruff-lsp

    # Install static analyzers
    pkgs.mypy

    # Install linters

    # Install formatters
    pkgs.alejandra
    pkgs.black
    pkgs.shfmt
    pkgs.stylua

    # echo "Install debbuggers"
    # TODO

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # (pkgs.glibcLocales.override {
    #   allLocales = false;
    #   locales = ["en_US.UTF-8/UTF-8"];
    # })
  ];

  home.file = {
    ".config/alacritty".source = symlink "${HOME}/dev-env/alacritty";
    ".config/awesome".source = symlink "${HOME}/dev-env/awesome";
    ".config/clangd".source = symlink "${HOME}/dev-env/clangd";
    ".config/home-manager".source = symlink "${HOME}/dev-env/home-manager";
    ".config/kitty".source = symlink "${HOME}/dev-env/kitty";
    ".config/lazygit".source = symlink "${HOME}/dev-env/lazygit";
    ".config/navi".source = symlink "${HOME}/dev-env/navi";
    ".config/nvim".source = symlink "${HOME}/dev-env/nvim";
    ".config/starship.toml".source = symlink "${HOME}/dev-env/starship/starship.toml";
    ".config/tmux".source = symlink "${HOME}/dev-env/tmux";
    ".config/zsh".source = symlink "${HOME}/dev-env/zsh";
    ".gitconfig".source = symlink "${HOME}/dev-env/git/.gitconfig";
    ".gitignore".source = symlink "${HOME}/dev-env/git/.gitignore";
    ".ripgreprc".source = symlink "${HOME}/dev-env/ripgrep/.ripgreprc";
    ".zshrc".source = symlink "${HOME}/dev-env/zsh/.zshrc";

    ".local/share/applications/Alacritty.desktop".source = symlink "${pkgs.alacritty}/share/applications/Alacritty.desktop";

    "bin".source = symlink "${HOME}/dev-env/bin";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
