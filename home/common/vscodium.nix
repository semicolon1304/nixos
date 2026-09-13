{ lib, pkgs, inputs, ... }: {
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-marketplace; with pkgs.open-vsx; [
        bbenoist.nix
        ms-python.python
        yusifaliyevpro.vscicons
        # vscodevim.vim
        jdinhlife.gruvbox
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        johnnymorganz.stylua
        shopify.ruby-lsp
        fanaticpythoner.better-todo-tree

      ];
      userSettings = {
        "terminal.integrated.fontFamily" = "MesloLGS NF";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "icons";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "mutableExtensionsDir" = false;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixpkgs-fmt";

        # nix formatter settings
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
          "editor.formatOnSave" = true;
        };

        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixpkgs-fmt" ];
            };
          };
        };
      };
      keybindings = [
        {
          key = "shift+alt+down";
          command = "editor.action.copyLinesDownAction";
          when = "editorTextFocus && !editorReadonly";
        }
      ];
    };
  };
}

# bbenoist.nix                                                                                                                                   1 ✘  18:10:03  
# ms-python.python
# yusifaliyevpro.vscicons
# # vscodevim.vim
# # kamadorueda.alejandra
# jdinhlife.gruvbox
# arrterian.nix-env-selector
# jnoortheen.nix-ide
# johnnymorganz.stylua
# shopify.ruby-lsp
# fanaticpythoner.better-todo-tree
# cweijan.vscode-office