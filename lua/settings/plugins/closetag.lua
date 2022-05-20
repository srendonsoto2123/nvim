local status_closetag, closetag = pcall( require, 'nvim-ts-closetag' )

if not status_closetag then
   return
end

closetag.setup({
   filetypes = { "html", "xml", "tsx", "jsx" }
})
