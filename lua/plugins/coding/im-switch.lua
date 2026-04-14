return {
  -- Auto IM switch
  {
    "drop-stones/im-switch.nvim",
    event = "VeryLazy",
    opts = {
      mode = "fixed",
      macos = {
        default_im = "com.apple.keylayout.ABC",
      },
      linux = {
        default_im = "keyboard-us",
      },
    },
  },
}
