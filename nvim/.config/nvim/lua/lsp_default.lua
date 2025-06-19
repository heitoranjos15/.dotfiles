local protocol = require('vim.lsp.protocol')
local navic = require("nvim-navic")

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
           if client.server_capabilities.documentSymbolProvider then
              navic.attach(client, bufnr)
          end
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
            vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
            vim.keymap.set("n", "<leader>rn", function()
                vim.lsp.buf.rename()
            end, { buffer = bufnr })
        end,
    }, _config or {})
end
