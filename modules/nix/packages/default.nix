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
    rustup
    nodejs_22
  ];
}