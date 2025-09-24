{ config, pkgs, lib, ... }:
{

  # Define the options for this module.
  # can be used in configuration.nix as `game-dev.enable = true;`
  options.game-dev.enable = lib.mkEnableOption "Enable game-dev configuration";

  config = lib.mkIf config.game-dev.enable {

    environment.systemPackages = with pkgs; [
      godot
      blender-hip
      aseprite
      pixelorama
      zed-editor
      jetbrains.rider
    ];
  };
}
