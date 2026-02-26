vim.keymap.set("i", "<C-CR>", function()
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<Esc>A<br><CR>", true, false, true),
    "n",
    false
  )
end, { desc = "Insertar <br> y salto de línea" })

