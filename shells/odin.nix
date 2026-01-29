{ pkgs }:
pkgs.mkShell {
    name = "odin-dev";
    buildInputs = with pkgs; [
        odin
        ols
        sdl3
        sdl3-ttf
        sdl3-image
        raylib
    ];
}
