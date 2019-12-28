{ config, ... }:

let
    colors = config.style.colors;
in {
    programs.rofi.theme = builtins.toFile "theme.rasi" ''
        /**
        * ROFI Color theme
        * User: Qball
        * Copyright: Dave Davenport
        */

        * {
            foreground:                  ${colors.foreground};
            background:                  ${colors.background};
            red:                         ${colors.color1};
            blue:                        ${colors.color4};
            normal-foreground:           @foreground;
            normal-background:           @background;
            selected-normal-foreground:  @background;
            selected-normal-background:  @blue;
            alternate-normal-foreground: @foreground;
            alternate-normal-background: @background;
            urgent-foreground:           @red;
            urgent-background:           @background;
            selected-urgent-foreground:  @foreground;
            selected-urgent-background:  @red;
            alternate-urgent-foreground: @foreground;
            alternate-urgent-background: @red;
            active-foreground:           @blue;
            active-background:           @background;
            selected-active-foreground:  @foreground;
            selected-active-background:  @blue;
            alternate-active-foreground: @foreground;
            alternate-active-background: @blue;
            bordercolor:                 ${colors.color0};
            spacing:                     2;
            background-color:            rgba ( 0, 0, 0, 0 % );
            lightbg:                     rgba ( 238, 232, 213, 100 % );
            lightfg:                     rgba ( 88, 104, 117, 100 % );
            border-color:                @bordercolor;
            separatorcolor:              @bordercolor;
        }
        #window {
            background-color: @background;
            border:           1;
            padding:          5;
        }
        #mainbox {
            border:  0;
            padding: 0;
        }
        #message {
            border:       2px 0px 0px ;
            border-color: @separatorcolor;
            padding:      1px ;
        }
        #textbox {
            text-color: @foreground;
        }
        #listview {
            fixed-height: 0;
            border:       2px 0px 0px ;
            border-color: @separatorcolor;
            spacing:      2px ;
            scrollbar:    true;
            padding:      2px 0px 0px ;
        }
        #element {
            border:  0;
            padding: 1px ;
        }
        #element.normal.normal {
            background-color: @normal-background;
            text-color:       @normal-foreground;
        }
        #element.normal.urgent {
            background-color: @urgent-background;
            text-color:       @urgent-foreground;
        }
        #element.normal.active {
            background-color: @active-background;
            text-color:       @active-foreground;
        }
        #element.selected.normal {
            background-color: @selected-normal-background;
            text-color:       @selected-normal-foreground;
        }
        #element.selected.urgent {
            background-color: @selected-urgent-background;
            text-color:       @selected-urgent-foreground;
        }
        #element.selected.active {
            background-color: @selected-active-background;
            text-color:       @selected-active-foreground;
        }
        #element.alternate.normal {
            background-color: @alternate-normal-background;
            text-color:       @alternate-normal-foreground;
        }
        #element.alternate.urgent {
            background-color: @alternate-urgent-background;
            text-color:       @alternate-urgent-foreground;
        }
        #element.alternate.active {
            background-color: @alternate-active-background;
            text-color:       @alternate-active-foreground;
        }
        #scrollbar {
            width:        4px ;
            border:       0;
            handle-width: 8px ;
            padding:      0;
        }
        #sidebar {
            border:       2px 0px 0px ;
            border-color: @separatorcolor;
        }
        #button.selected {
            background-color: @selected-normal-background;
            text-color:       @selected-normal-foreground;
        }
        #inputbar {
            spacing:    0;
            text-color: @normal-foreground;
            padding:    1px ;
        }
        #case-indicator {
            spacing:    0;
            text-color: @normal-foreground;
        }
        #entry {
            spacing:    0;
            text-color: @normal-foreground;
        }
        #prompt, button{
            spacing:    0;
            text-color: @normal-foreground;
        }
        #inputbar {
            children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
        }
        #textbox-prompt-colon {
            expand:     false;
            str:        ":";
            margin:     0px 0.3em 0em 0em ;
            text-color: @normal-foreground;
        }
    '';
}