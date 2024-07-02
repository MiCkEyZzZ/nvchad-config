local present, illuminate = pcall(require, "illuminate")

if not present then
  return
end

illuminate.configure {
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  max_file_lines = nil,
  delay = 100,
  under_cursor = true,
  filetypes_denylist = {
    "alpha",
    "dashboard",
    "DoomInfo",
    "fugitive",
    "help",
    "norg",
    "NvimTree",
    "Trouble",
    "Outline",
    "packer",
    "toggleterm",
    "TelescopePrompt",
    "Empty",
    "dirvish",
    "neogitstatus",
    "spectre_panel",
    "DressingSelect",
    "aerial",
  },
  under_cursor = false,
}

-- https://github.com/RRethy/vim-illuminate/issues/115#issuecomment-1221297926
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })