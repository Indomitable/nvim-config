return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = true,
            })

            vim.keymap.set("n", "<leader>tm", function()
                require("trouble").toggle()
            end, { desc = "[T]oggle diagnostic [M]essages" })

            vim.keymap.set("n", "]t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end, { desc = "Next diagnostic message" } )

            vim.keymap.set("n", "[t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end, { desc = "Previous diagnostic message" })

        end
    },
}
