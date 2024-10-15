vim.g.mapleader = " "

local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Shortcuts
map("n", "<leader>w", "<CMD>update<CR>", "Quick save")
map("n", "<leader>q", "<CMD>q<CR>", "Quick quit")
map("i", "jk", "<ESC>", "Exit insert mode")

-- Windows
map("n", "<leader>o", "<CMD>vsplit<CR>", "New vertical split window")
map("n", "<leader>p", "<CMD>split<CR>", "New horizontal split window")
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-l>", "<C-w>l", "Move to right window")
map("n", "<C-k>", "<C-w>k", "Move to upper window")
map("n", "<C-j>", "<C-w>j", "Move to lower window")
map("n", "<a-h>", "<C-w><", "Expand window left")
map("n", "<a-l>", "<C-w>>", "Expand window right")
map("n", "<a-k>", "<C-w>+", "Expand window top")
map("n", "<a-j>", "<C-w>-", "Expand window bottom")

-- Terminal
map("n", "<C-t>", '<CMD>exe v:count1 . "ToggleTerm"<CR>', "Toggle terminal")
map("v", "<C-t>", '<Esc><CMD>exe v:count1 . "ToggleTerm"<CR>', "Toggle terminal")
map("v", "<leader>st", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", true, { args = vim.v.count })
end, "Send visual selection to terminal")
map("t", "<esc>", [[<C-\><C-n>]], "Exit terminal")
map("t", "jk", [[<C-\><C-n>]], "Exit terminal")
map("t", "<a-h>", [[<Cmd>wincmd h<CR>]], "")
map("t", "<a-j>", [[<Cmd>wincmd j<CR>]], "")
map("t", "<a-k>", [[<Cmd>wincmd k<CR>]], "")
map("t", "<a-l>", [[<Cmd>wincmd l<CR>]], "")

-- LSP actions
-- map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition, "Go to definition")
map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
map("n", "gr", vim.lsp.buf.references, "Go to references")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Run code action")
map("n", "<leader>rn", vim.lsp.buf.rename, "Run LSP rename action")

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics in popup")
map("n", "<leader>dd", vim.diagnostic.setqflist, "Open diagnostics list")
