{
  config,
  pkgs,
  ...
}: let
  HOME = builtins.getEnv "HOME";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gerard";
  home.homeDirectory = "/home/gerard";

  home.stateVersion = "24.05"; # Can introduce breaking changes if changed

  home.packages = [
    # (nixGLWrap pkgs.alacritty) disabled until nixgl is fixed
    pkgs.bat
    pkgs.btop
    pkgs.cargo
    pkgs.curl
    pkgs.delta
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.git
    pkgs.glibcLocales
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.lua
    pkgs.navi
    pkgs.neovim
    pkgs.nodejs_20
    pkgs.oh-my-posh
    pkgs.ripgrep
    pkgs.tldr
    pkgs.tmux
    pkgs.tree-sitter # Used by nvim-treesitter
    pkgs.ueberzugpp # Used by yazi
    pkgs.util-linux
    pkgs.yazi
    pkgs.zoxide
    pkgs.zsh

    # Install language servers
    pkgs.clang-tools # clangd, clang-format, clang-tidy
    pkgs.cmake-language-server
    pkgs.lua-language-server
    pkgs.marksman
    pkgs.nixd
    pkgs.nodePackages.bash-language-server
    pkgs.pyright
    pkgs.ruff-lsp
    pkgs.rust-analyzer

    # Install static analyzers
    pkgs.mypy

    # Install linters

    # Install formatters
    pkgs.alejandra
    pkgs.black
    pkgs.rustfmt
    pkgs.shfmt
    pkgs.stylua

    # WM
    pkgs.blueberry
    pkgs.networkmanagerapplet
    pkgs.pavucontrol
    pkgs.picom
    pkgs.polybar
    pkgs.rofi
    pkgs.variety

    # markdown to PDF
    pkgs.ghostscript
    pkgs.groff
    pkgs.pandoc

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
    ".config/btop".source = symlink "${HOME}/dev-env/btop";
    ".config/clangd".source = symlink "${HOME}/dev-env/clangd";
    ".config/home-manager".source = symlink "${HOME}/dev-env/home-manager";
    ".config/kitty".source = symlink "${HOME}/dev-env/kitty";
    ".config/lazydocker".source = symlink "${HOME}/dev-env/lazydocker";
    ".config/lazygit".source = symlink "${HOME}/dev-env/lazygit";
    ".config/navi".source = symlink "${HOME}/dev-env/navi";
    ".config/nvim".source = symlink "${HOME}/dev-env/nvim";
    ".config/oh-my-posh".source = symlink "${HOME}/dev-env/oh-my-posh";
    ".config/picom".source = symlink "${HOME}/dev-env/picom";
    ".config/polybar".source = symlink "${HOME}/dev-env/polybar";
    ".config/rofi".source = symlink "${HOME}/dev-env/rofi";
    ".config/tmux".source = symlink "${HOME}/dev-env/tmux";
    ".config/yazi".source = symlink "${HOME}/dev-env/yazi";
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
