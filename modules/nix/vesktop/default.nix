{ pkgs, ... }: {
  users.users.lennox.packages = with pkgs; [
    (pkgs.callPackage ./source/package.nix {})
  ];
}