local ok_status, snippy = pcall(require, "snippy");

if not ok_status then
  vim.notify(snippy, "error", {
    title = "Snippy"
  })
  return; 
end

snippy.setup({
  snippet_dirs = vim.fn.stdpath('config') .. '/snippets',
  scopes = {
    _ = {} 
  },
  mappings = {
    is = {
      ["<Tab>"] = "expand_or_advance",
      ["<S-Tab>"] = "previous",
    },
  }
})

