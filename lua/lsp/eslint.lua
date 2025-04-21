-- Still doesn't work TODO: find a way around in order to remove nvim-lspconfig
return {
    cmd = { 'eslint' },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro", "svg", "html" },
}
