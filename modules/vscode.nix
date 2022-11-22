{ pkgs,  ... }:

{
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
        name = "gitlab-workflow";
        publisher = "GitLab";
        version = "3.57.1";
        sha256 = "sha256-zdhhH8ebSq6e+Y9kL+v0Br3lao0ZSEbXxCK9pw2tSFM=";
    }
  ];
    /*
    mhutchie.git-graph
    eamodio.gitlens
    hashicorp.terraform
    yzhang.markdown-all-in-one
    rust-lang.rust-analyzer
    redhat.vscode-yaml
    */
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
  ];
}