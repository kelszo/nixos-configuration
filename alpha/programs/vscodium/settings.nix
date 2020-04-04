{ ... }: {
  "workbench.iconTheme" = "material-icon-theme";
  "workbench.colorTheme" = "Atom One Light";
  "editor.renderWhitespace" = "none";

  # javascript
  "javascript.format.semicolons" = "insert";
  "javascript.implicitProjectConfig.checkJs" = true;
  "javascript.preferences.quoteStyle" = "single";
  "typescript.format.semicolons" = "insert";
  "typescript.preferences.quoteStyle" = "single";
  "prettier.printWidth" = 500;
  "prettier.singleQuote" = true;
  "prettier.trailingComma" = "all";
  "prettier.arrowParens" = "always";
  "editor.formatOnPaste" = true;
  "editor.formatOnSave" = true;
  "editor.suggestSelection" = "first";
  "editor.tabSize" = 2;
  "markdown.extension.toc.githubCompatibility" = true;

  #golang
  "go.useLanguageServer" = true;

  "[go]" = {
    "editor.formatOnSave" = true;
    "editor.codeActionsOnSave" = { "source.organizeImports" = true; };

    "editor.snippetSuggestions" = "none";

  };

  "[go.mod]" = {
    "editor.formatOnSave" = true;
    "editor.codeActionsOnSave" = { "source.organizeImports" = true; };
  };

  "gopls" = {
    "usePlaceholders" = true;
    "staticcheck" = true;
  };

  # latex
  "latex-workshop.latex.outputDir" = "./out/";
  "latex-workshop.latex.outDir" = "./out/";
  "latex-workshop.view.pdf.viewer" = "tab";
  "latex-workshop.latex.tools" = [
    {
      "name" = "latexmk";
      "command" = "latexmk";
      "args" = [
        "-synctex=1"
        "-interaction=nonstopmode"
        "-file-line-error"
        "-pdf"
        "-aux-directory=out"
        "-output-directory=out"
        "%DOC%"
      ];
    }
    {
      "name" = "pdflatex";
      "command" = "pdflatex";
      "args" = [
        "-synctex=1"
        "-interaction=nonstopmode"
        "-file-line-error"
        "-aux-directory=out"
        "-output-directory=out"
        "%DOC%"
      ];
    }
  ];

  "[latex]" = { "editor.wordWrap" = "on"; };
}
