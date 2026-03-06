return {
  {
-- Plugin still not working correctly, probably need to change settings
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- PDF viewer
      vim.g.vimtex_view_method = "zathura"

      -- Compiler
      vim.g.vimtex_compiler_method = "latexmk"

      -- Optional: conceal etwas entschärfen
      vim.g.tex_conceal = "abdmg"

      -- Quickfix nach Build automatisch öffnen bei Fehlern
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
