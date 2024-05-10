return {
    "numToStr/FTerm.nvim",
    config = function ()
        --local fterm = require("FTerm")
        --fterm.setup()
        vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
        vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
        vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
    end
}
