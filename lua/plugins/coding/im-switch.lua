return {
  -- Auto IM switch
  {
    "drop-stones/im-switch.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      mode = "fixed",
      macos = {
        default_im = "com.apple.keylayout.ABC",
      },
      linux = {
        default_im = "keyboard-us",
      },
      wsl2 = {
        -- Enable the loopback IPC fast path
        server = true,
      },
    },
  },
}
