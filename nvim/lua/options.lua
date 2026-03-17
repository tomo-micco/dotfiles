-- lang setting
vim.cmd("language ja_JP.UTF-8")

-- Files
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.hidden = true

-- Cursor
vim.opt.cursorline = true

-- Clip board
vim.opt.clipboard:append({ "unnamedplus" })

-- search and replace
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 1

-- Color Sheme
vim.opt.termguicolors = true

-- Indents
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- visual
vim.opt.number = true
vim.opt.wrap = true
vim.opt.showtabline = 2
vim.opt.visualbell = true
vim.opt.showmatch = true

-- Interface
vim.opt.winblend = 80
vim.opt.pumblend = 0
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"

-- row number's color
vim.cmd("highlight LineNr guifg=#8a70ac")

-- Cursor form
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- selectable line end in visual mode
vim.opt.virtualedit:append("block")

-- signcolumn's opacity
vim.diagnostic.config({ serverity_sort = true })
