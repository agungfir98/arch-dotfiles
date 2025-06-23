return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      width = 45,
      preset = {
        header = [[
███╗   ███╗███████╗███╗   ██╗██████╗  ██████╗
████╗ ████║██╔════╝████╗  ██║██╔══██╗██╔═══██╗
██╔████╔██║█████╗  ██╔██╗ ██║██║  ██║██║   ██║
██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║  ██║██║   ██║
██║ ╚═╝ ██║███████╗██║ ╚████║██████╔╝╚██████╔╝
╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝  ╚═════╝
]],
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "",
          height = 8,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
