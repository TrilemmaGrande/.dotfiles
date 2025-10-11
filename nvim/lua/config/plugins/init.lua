-- Importiere Plugin-Module (jeder gibt eine Liste mit plugin-specs zurück)
return {
    { import = "config.plugins.ui" },
    { import = "config.plugins.editor" },
    { import = "config.plugins.tools" },
    { import = "config.plugins.lsp" },
}
