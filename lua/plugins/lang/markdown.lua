return {
  -- markdown
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    -- We render markdown via render-markdown.nvim and disable obsidian.nvim's
    -- built-in UI (see obsidian.lua) so two renderers don't compete. The LazyVim
    -- markdown extra turns checkbox rendering off (it assumed obsidian drew them),
    -- so re-enable it and mirror obsidian's bullet / checkbox states here.
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- render-markdown's default `●` (U+25CF) is not in our Nerd Font, so it
      -- falls back to another font that draws it full-width and overlaps the text.
      -- Use the in-font Nerd Font circle instead, which has the right width.
      bullet = { icons = { "󰧞" } },
      checkbox = {
        enabled = true,
        -- `[ ]` and `[x]` are part of the markdown grammar and use render-markdown's
        -- default icons. `[/]` (in progress) is the only non-standard state we keep;
        -- it must match obsidian's `checkbox.order` ({ " ", "/", "x" }) so the icon
        -- stays in sync with `:Obsidian toggle_checkbox`. `[/]` is the de-facto
        -- standard "in progress" marker (Obsidian Tasks, Minimal/ITS themes). We
        -- render it with the indeterminate-checkbox glyph so it matches the square
        -- shape of `[ ]`/`[x]`. Note: a checkbox only renders when followed by task
        -- text (e.g. `- [/] foo`).
        custom = {
          in_progress = { raw = "[/]", rendered = "󰡖 ", highlight = "RenderMarkdownInfo" },
        },
      },
    },
  },
}
