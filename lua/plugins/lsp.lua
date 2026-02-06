return {
{
    "mason-org/mason.nvim",
    opts = {}
},
{
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependenies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    }
},
{
    "neovim/nvim-lspconfig"
}
}
