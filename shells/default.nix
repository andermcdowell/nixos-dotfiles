{ pkgs }:
{
    default = import ./shell.nix { inherit pkgs; };
    odin = import ./odin.nix { inherit pkgs; };
}
