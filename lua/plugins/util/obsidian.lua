return {
  -- Obsidian 🤝 Neovim
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>o", group = "obsidian", mode = { "n", "v" } },
      },
    },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- latest release
    ft = "markdown",
    keys = {
      -- Note
      {
        "<leader>on",
        function()
          -- Quick fleeting capture: always routed to the "inbox" folder
          -- via the `fleeting` template customization.
          local title = require("obsidian.api").input("Title (optional): ")
          if title == nil then
            return
          end
          local note = require("obsidian.note").create({
            id = title ~= "" and title or nil,
            template = "fleeting",
          })
          -- `create` only builds the note in memory; `write` applies the
          -- template and persists it before we open the buffer.
          note:write()
          note:open({ sync = true })
        end,
        desc = "New fleeting note (inbox)",
      },
      { "<leader>oN", "<Cmd>Obsidian new_from_template<Cr>", desc = "New from template" },
      -- Daily Notes
      { "<leader>od", "<Cmd>Obsidian dailies<Cr>", desc = "Dailies picker" },
      { "<leader>ot", "<Cmd>Obsidian today<Cr>", desc = "Today note" },
      { "<leader>oT", "<Cmd>Obsidian tomorrow<Cr>", desc = "Tomorrow note" },
      { "<leader>oy", "<Cmd>Obsidian yesterday<Cr>", desc = "Yesterday note" },
      -- Search
      { "<leader>of", "<Cmd>Obsidian quick_switch<Cr>", desc = "Find Note" },
      { "<leader>os", "<Cmd>Obsidian search<Cr>", desc = "Search for notes" },
      { "<leader>og", "<Cmd>Obsidian tags<Cr>", desc = "Find by Tag(s)" },
      { "<leader>ow", "<Cmd>Obsidian workspace<Cr>", desc = "Switch workspace" },
      -- Help
      { "<leader>o?", "<Cmd>Obsidian help<Cr>", desc = "Find in help wiki" },
      { "<leader>o/", "<Cmd>Obsidian helpgrep<Cr>", desc = "Grep in help wiki" },
      -- Commands in Note
      { "<leader>or", "<Cmd>Obsidian rename<Cr>", desc = "Rename note" },
      { "<leader>op", "<Cmd>Obsidian template<Cr>", desc = "Insert template" },
      { "<leader>ob", "<Cmd>Obsidian backlinks<Cr>", desc = "Backlinks picker" },
      { "<leader>ok", "<Cmd>Obsidian links<Cr>", desc = "Links picker" },
      { "<leader>oo", "<Cmd>Obsidian follow_link<Cr>", desc = "Follow link" },
      { "<leader>oC", "<Cmd>Obsidian toc<Cr>", desc = "Table of contents picker" },
      { "<leader>oi", "<Cmd>Obsidian paste_img<Cr>", desc = "Paste image" },
      { "<leader>oc", "<Cmd>Obsidian toggle_checkbox<Cr>", desc = "Toggle checkbox" },
      -- Visual Mode
      { "<leader>ox", "<Cmd>Obsidian extract_note<Cr>", desc = "Extract to new note", mode = { "v" } },
      { "<leader>ol", "<Cmd>Obsidian link<Cr>", desc = "Link to note", mode = { "v" } },
      { "<leader>oL", "<Cmd>Obsidian link_new<Cr>", desc = "Link to new note", mode = { "v" } },
    },

    -- Scaffold the vault: create the folder structure and copy templates.
    build = function()
      local vault = vim.fn.expand("~/Documents/notes")

      -- On WSL2, keep the vault on the Windows side (under the real Windows
      -- "Documents" folder, so OneDrive can sync it) and expose it in Linux as
      -- a symlink at ~/Documents/notes.
      if vim.fn.has("wsl") == 1 and vim.uv.fs_lstat(vault) == nil then
        -- Resolve the actual Documents path (honors OneDrive redirection).
        local win_docs = vim.fn.trim(vim.fn.system({ "powershell.exe", "-NoProfile", "-Command", "[Environment]::GetFolderPath('MyDocuments')" }))
        local target = vim.fn.trim(vim.fn.system({ "wslpath", "-u", win_docs })) .. "/notes"
        vim.fn.mkdir(target, "p")
        vim.fn.mkdir(vim.fs.dirname(vault), "p") -- ensure ~/Documents exists
        vim.uv.fs_symlink(target, vault)
      end

      -- Create the folder structure so the vault is browsable right away.
      for _, sub in ipairs({ "inbox", "notes", "daily", "assets", "templates" }) do
        vim.fn.mkdir(vault .. "/" .. sub, "p")
      end

      -- Copy the templates shipped with this config into the vault, only the
      -- ones that are missing so local edits in the vault are preserved.
      -- Resolve via the runtimepath so it works regardless of where the config
      -- physically lives (e.g. Nix/home-manager symlinks into the store).
      local dst_dir = vault .. "/templates"
      local srcs = vim.api.nvim_get_runtime_file("lua/plugins/util/obsidian/templates/*.md", true)
      for _, src in ipairs(srcs) do
        local dst = dst_dir .. "/" .. vim.fs.basename(src)
        if vim.fn.filereadable(dst) == 0 then
          vim.fn.writefile(vim.fn.readfile(src), dst)
        end
      end
    end,

    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,

      -- Default capture/fallback location for newly generated notes.
      notes_subdir = "inbox",

      -- `link_new` and bare creations land next to the current note; the
      -- template customizations below override this per note type.
      new_notes_location = "current_dir",

      -- Use the title to build the filename (slug) instead of a timestamp id.
      note_id_func = function(title, path)
        return require("obsidian.builtin").title_id(title, path)
      end,

      ---@type obsidian.config.TemplateOpts
      templates = {
        folder = "templates",

        -- Selecting a template routes the new note to the matching folder.
        customizations = {
          fleeting = { notes_subdir = "inbox" },
          permanent = { notes_subdir = "notes" },
          literature = { notes_subdir = "notes" },
          moc = { notes_subdir = "notes" },
        },
      },

      ---@type obsidian.config.NoteOpts
      note = {
        -- Bare `Obsidian new` and `extract_note` create permanent notes.
        template = "permanent",
      },

      ---@type obsidian.config.DailyNotesOpts
      daily_notes = {
        folder = "daily",
        template = "daily.md",
        -- Tag daily notes via the built-in mechanism (matches the single-word
        -- type tags used elsewhere) instead of seeding it in the template,
        -- replacing the default `daily-notes` tag.
        default_tags = { "daily" },
      },

      ---@type obsidian.config.AttachmentsOpts
      attachments = {
        folder = "assets",
      },

      workspaces = {
        {
          name = "notes",
          path = "~/Documents/notes",
          strict = true, -- use the `path` as the workspace/vault root
        },
      },
    },
  },
}
