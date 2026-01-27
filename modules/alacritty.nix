{ config, pkgs, ... }:

{
    programs.alacritty = {
        enable = true;

        settings = {
            window = {
                decorations = "none";
                opacity = 0.8;
            };

            # kanagawa wave
            colors.primary = {
                background = "#0f1f28";
                foreground = "#dcd7ba";
            };

            colors.normal = {
                black = "#090618";
                red = "#c34043";
                green = "#76946a";
                yellow = "#c0a36e";
                blue = "#7e9cd8";
                magenta = "#957fb8";
                cyan = "#6a9589";
                white = "#c8c093";
            };

            colors.bright = {
                black = "#727169";
                red = "#e82424";
                green = "#98bb6c";
                yellow = "#e6c384";
                blue = "#7fb4ca";
                magenta = "#938aa9";
                cyan = "#7aa89f";
                white = "#dcd7ba";
            };

            colors.selection = {
                background = "#2d4f67";
                foreground = "#c8c093";
            };

            font.size = 12;

            font.normal = {
                family = "MonaspiceNe Nerd Font";
                style = "Regular";
            };

            font.bold = {
                family = "MonaspiceNe Nerd Font";
                style = "Bold";
            };

            font.italic = {
                family = "MonaspiceNe Nerd Font";
                style = "Italic";
            };

            font.bold_italic = {
                family = "MonaspiceNe Nerd Font";
                style = "Bold Italic";
            };
        };
    };
}