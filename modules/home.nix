{
  config,
  pkgs,
  ...
}: {
  home.username = "nw";
  home.homeDirectory = "/home/nw";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    kdePackages.kate
    discord
    vlc
    veracrypt
    steam
    emacs
    mullvad
    fd
    tree
    glib
    neovim
    ripgrep
    # Programming Languages
    go
    python3
    # Code Formatters
    alejandra
    black
    stylua
    gofumpt
    prettier
    prettierd
    # Language Servers
    clang-tools
    gopls
    lua-language-server
    pyright
    # Linters
    ruff
  ];

  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };
}
