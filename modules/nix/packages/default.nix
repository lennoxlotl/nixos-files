{ pkgs, ... }: {
  # Install important base packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    htop
    btop
    p7zip
    unzip
    unrar
    libnotify
    libsixel
    libva-utils
    nvtopPackages.amd
    neofetch
    # Toolchains
    openssl
    openssl.dev
    bison
    flex
    fontforge
    makeWrapper
    pkg-config
    gnumake
    gcc
    libiconv
    autoconf
    automake
    libtool
    postgresql_16
    rustup
    nodejs_22
    jdk17
    protobuf
  ];
  environment.variables = {
    PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
  };
}