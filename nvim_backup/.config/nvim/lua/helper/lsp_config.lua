local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local protocol = require('vim.lsp.protocol')
protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

return function(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
            nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
            nnoremap('<space>lrn',function() vim.lsp.buf.rename() end)
            nnoremap("gi", function() vim.lsp.buf.implementation() end)
            -- if client.server_capabilities.documentFormattingProvider then
            --     vim.api.nvim_create_autocmd("BufWritePre", {
            --         group = vim.api.nvim_create_augroup("Format", { clear = true }),
            --         buffer = bufnr,
            --         callback = function() vim.lsp.buf.formatting_seq_sync() end
            --     })
            -- end
        end,
    }, _config or {})
end
