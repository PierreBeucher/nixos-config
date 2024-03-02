{ pkgs,  ... }:

{
  enable = true;
  
  userSettings = {
    # Git
    "git.allowForcePush" = "true";
    "git.useEditorAsCommitInput" = "false";

    # Nix
    "nix.enableLanguageServer" = "true";
    "nix.serverPath" = "nil";
    "explorer.confirmDragAndDrop" = "false";
    
    # Terminal
    "terminal.integrated.enableMultiLinePasteWarning" = "false";
    
    # yzhang.markdown-all-in-one
    "markdown.extension.toc.levels" =  "2..6";

    # streetsidesoftware.code-spell-checker
    "cSpell.userWords" = [
        "pulumi" 
        "novops"
        "hvault"
        "hashicorp"
        "myinstance"
        "mystaticip"
        "crafteo"
        "pbeucher"
        "nix"
        "nixos"
        "Skooner"
        "skooner"
        "Azure"
        "azure"
        "cdktf"
        "azurerm"
        "serviceaccount"
    ];

    "editor.inlineSuggest.enabled" = true;
  };

  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    matklad.rust-analyzer
    hashicorp.terraform
    yzhang.markdown-all-in-one
    redhat.vscode-yaml
    gitlab.gitlab-workflow
    editorconfig.editorconfig
    dbaeumer.vscode-eslint
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
        name = "gitblame";
        publisher = "waderyan";
        version = "9.0.1";
        sha256 = "sha256-NA3qHeMEPfxcQC/TV1cnlDGX+oYc2wV+gXKu6oSZNiY=";
    }
    {
        name = "gitlab-workflow";
        publisher = "GitLab";
        version = "3.57.1";
        sha256 = "sha256-zdhhH8ebSq6e+Y9kL+v0Br3lao0ZSEbXxCK9pw2tSFM=";
    }
    {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.30.0";
        sha256 = "sha256-sHeaMMr5hmQ0kAFZxxMiRk6f0mfjkg2XMnA4Gf+DHwA=";
    }
    {
        name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "1.0.5776";
        sha256 = "sha256-BamhVT1fmgpDKhoBTYdwIvuWUbHzF363WnKLz2ql3Lo=";
    }
    {
        name = "vscode-typescript-next";
        publisher = "ms-vscode";
        version = "5.0.202211170";
        sha256 = "sha256-Jy7ssTYrVq8s596Vj132jf4JOzEhZL8y45ARsADGgsE=";
    }
    {
        name = "prettify-json";
        publisher = "mohsen1";
        version = "0.0.3";
        sha256 = "sha256-lvds+lFDzt1s6RikhrnAKJipRHU+Dk85ZO49d1sA8uo=";
    }
    {
        name = "markdown-preview-enhanced";
        publisher = "shd101wyy";
        version = "0.6.5";
        sha256 = "sha256-Aw41V1hCZ3reZRptfqFDdBef9spHjkfMngVotF2ptek=";
    }
    {
        name = "vscode-kubernetes-tools";
        publisher = "ms-kubernetes-tools";
        version = "1.3.15";
        sha256 = "sha256-EXFE8F0ZhPcF7CxxarJzFSrZQAcNhqZL52GZCxK71vQ=";
    }
    {
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.19.2";
        sha256 = "sha256-JKj6noi2dTe02PxX/kS117ZhW8u7Bhj4QowZQiJKP2E=";
    }
  ];
  
  keybindings = [
    {
        key = "ctrl+shift+k";
        command = "git.push";
    }
    {
        key = "ctrl+shift+v";
        command = "-markdown-preview-enhanced.openPreview";
        when = "editorLangId == 'markdown'";
    }
    {
        key = "ctrl+shift+v";
        command = "-markdown.showPreview";
        when = "!notebookEditorFocused && editorLangId == 'markdown'";
    }
    {
        key = "ctrl+shift+v";
        command = "-notebook.cell.pasteAbove";
        when = "notebookEditorFocused && !inputFocus";
    }
    {
        key = "ctrl+shift+k";
        command = "markdown-preview-enhanced.openPreviewToTheSide";
        when = "editorLangId == 'markdown'";
    }
    {
        key = "ctrl+k v";
        command = "-markdown-preview-enhanced.openPreviewToTheSide";
        when = "editorLangId == 'markdown'";
    }
    {
        key = "ctrl+shift+m";
        command = "-workbench.actions.view.problems";
        when = "workbench.panel.markers.view.active";
    }
    {
        key = "ctrl+shift+m";
        command = "markdown.showPreviewToSide";
        when = "!notebookEditorFocused && editorLangId == 'markdown'";
    }
    {
        key = "ctrl+k v";
        command = "-markdown.showPreviewToSide";
        when = "!notebookEditorFocused && editorLangId == 'markdown'";
    }
    {
        key = "ctrl+k ctrl+c";
        command = "-editor.action.addCommentLine";
        when = "editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+numpad_divide";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+shift+[Period]";
        command = "-editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+enter";
        command = "git.stage";
    }
    {
        key = "alt+g";
        command = "git-graph.view";
    }
    {
        key = "alt+b";
        command = "git.branch";
    }
    {
        key = "ctrl+shift+a";
        command = "-editor.action.blockComment";
        when = "editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+shift+[Slash]";
        command = "git.pushForce";
    }
    {
        key = "ctrl+shift+r";
        command = "-editor.action.refactor";
        when = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+shift+r";
        command = "-rerunSearchEditorSearch";
        when = "inSearchEditor";
    }
    {
        key = "ctrl+shift+r";
        command = "-workbench.action.quickOpenNavigatePreviousInRecentFilesPicker";
        when = "inQuickOpen && inRecentFilesPicker";
    }
    {
        key = "ctrl+shift+r";
        command = "-extension.vsKubernetesDescribe.Refresh";
        when = "vscodeKubernetesDescribeContext";
    }
    {
        key = "ctrl+shift+r";
        command = "gl.openCurrentMergeRequest";
    }
    {
        key = "ctrl+q";
        command = "-workbench.action.quit";
    }
    {
        key = "ctrl+shift+a";
        command = "git.commitStagedAmend";
    }
    {
        key = "ctrl+n";
        command = "explorer.newFile";
    }
    {
        key = "ctrl+n";
        command = "-workbench.action.files.newUntitledFile";
    }
    {
        key = "ctrl+[Slash]";
        command = "workbench.action.focusActiveEditorGroup";
        when = "terminalFocus";
    }
    {
        key = "ctrl+[Slash]";
        command = "workbench.action.terminal.focus";
        when = "!terminalFocus";
    }
    # {
    #     command = "cSpell.addWordToWorkspaceDictionary";
    #     key = "ctrl+shift+D";
    #     when = "!terminalFocus";
    # }
    {
        key = "ctrl+f2";
        command = "-editor.action.changeAll";
        when = "editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+f2";
        command = "workbench.action.terminal.renameWithArg";
    }
  ];

  userTasks = {
    "version" = "2.0.0";
    "tasks" = [
        {
            "type" = "shell";
            "label" = "dev";
            "command" = "nix develop";
            "options" = {
                "env" = {
                    "NOVOPS_ENVIRONMENT" = "dev";
                };
            };
            "problemMatcher" = [ ];
            "presentation" = {
                "echo" = false;
                "focus" = true;
                "showReuseMessage" = false;
                "close" = true;
            };
        }
        {
            "type" = "shell";
            "label" = "integ";
            "command" = "nix develop";
            "options" = {
                "env" = {
                "NOVOPS_ENVIRONMENT" = "integ";
                };
            };
            "problemMatcher" = [ ];
            "presentation" = {
                "echo" = false;
                "focus" = true;
                "showReuseMessage" = false;
                "close" = true;
            };
        }
        {
            "type" = "shell";
            "label" = "preprod";
            "command" = "nix develop";
            "options" = {
                "env" = {
                "NOVOPS_ENVIRONMENT" = "preprod";
                };
            };
            "problemMatcher" = [ ];
            "presentation" = {
                "echo" = false;
                "focus" = true;
                "showReuseMessage" = false;
                "close" = true;
            };
        }
        {
            "type" = "shell";
            "label" = "prod";
            "command" = "nix develop";
            "options" = {
                "env" = {
                "NOVOPS_ENVIRONMENT" = "prod";
                };
            };
            "problemMatcher" = [ ];
            "presentation" = {
                "echo" = false;
                "focus" = true;
                "showReuseMessage" = false;
                "close" = true;
            };
        }
        {
            "label" = "sauermann-novops";
            "dependsOn" = [ "dev" "integ" "preprod" "prod" ];
            "problemMatcher" = [];
        }
    ];
  };

}