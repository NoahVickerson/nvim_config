function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "LineNr", { fg = "#6f6c82" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalNC",   { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "VertSplit",  { bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Folded",     { bg = "NONE" })

end

ColorMyPencils()
