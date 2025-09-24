# 💫 https://github.com/JaKooLit 💫 #
# Packages for this host only

{ pkgs, ... }:
let

  python-packages = pkgs.python3.withPackages (
    ps: with ps; [
      requests
      pyquery # needed for hyprland-dots Weather script
    ]
  );

in
{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
    (with pkgs; [
      # System Packages
      ntfs3g

      fastfetch

      #waybar  # if wanted experimental next line
      #(pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];}))
      vscode
      headsetcontrol
      libva # VA_API

      vulkan-tools
      clinfo

      protonup-qt
      lutris
      bottles
      heroic

      vlc
    ])
    ++ [
      python-packages 
    ];

  programs = {

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

  };
  
  services.udev.packages = [ pkgs.headsetcontrol ];
}
