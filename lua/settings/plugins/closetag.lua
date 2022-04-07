local g = vim.g

g.closetag_filenames = "*.html,*.xhtml,*.phtml"

g.closetag_xhtml_filename = "*.xhtml,*.jsx"

g.closetag_xhtml_filetype = "xhtml,jsx"

g.closetag_emptyTags_caseSensitive = 1

g.closetag_regions = {
  [ "typescript.tsx" ] = "jsxRegion,tsxRegion",
  [ "javascript.jsx" ] = "jsxRegion",
  typescriptreact = "jsxRegion,tsxRegion",
  javascriptreact = "jsxRegion"
}

g.closetag_shortcut = ">"

g.closetag_close_shortcut = "<Leader>>"
