-- terminal.lua

-- ToggleTerm setup
require("toggleterm").setup {
    -- Size of the terminal window
    size = 20,

    -- Keymap to toggle the terminalf
    open_mapping = [[<c-\>]],
    -- Hide line numbers in the terminal
    hide_numbers = true,

    -- Shade certain filetypes
    shade_filetypes = { "clap_prompt" },

    -- Automatically change the directory to the current file's location
    autochdir = true,

    -- Set the terminal title
    title = "Terminal",

    -- Set the shell to use
    shell = vim.o.shell,

    -- Set the direction of the terminal window
    direction = "horizontal",

    -- Set the terminal window to open at the bottom
    side = "bottom",

    -- Set the terminal window to attach to the Neovim window
    float = false,

    -- Set the terminal's startup command
    start_in_insert = true,

    -- Set the terminal's insert mode keymap
    insert_mappings = true,

    -- Set the terminal's persist mode
    persist_mode = true,

    -- Set the terminal's close-on-exit option
    close_on_exit = true,

    -- Set the terminal's auto-scroll option
    auto_scroll = true,
}

-- Create a new terminal toggle command
vim.api.nvim_create_user_command("Term", function()
    require("toggleterm").toggle(1)
end, {})

-- Create a new terminal toggle-all command
vim.api.nvim_create_user_command("TermAll", function()
    require("toggleterm").toggle_all()
end, {})
