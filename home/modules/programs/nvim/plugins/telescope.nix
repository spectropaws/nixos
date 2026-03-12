{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    telescope-ui-select-nvim
    telescope-fzf-native-nvim   # add this — pre-compiled in nixpkgs, no build needed
    {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        require("telescope").setup({
          defaults = {
            sorting_strategy = "ascending",
            layout_config = {
              prompt_position = "top",
              horizontal = { preview_width = 0.55 },
            },
            mappings = {
              i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
              },
            },
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({})
            },
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
          },
        })

        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("fzf")

        -- Keymaps
        vim.keymap.set("n", "<C-p>",        builtin.find_files,  { desc = "Find files" })
        vim.keymap.set("n", "<leader><leader>", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fb",   builtin.buffers,     { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fh",   builtin.help_tags,   { desc = "Help tags" })
        vim.keymap.set("n", "<leader>fr",   builtin.oldfiles,    { desc = "Recent files" })
        vim.keymap.set("n", "<leader>fd",   builtin.diagnostics, { desc = "Diagnostics" })
        vim.keymap.set("n", "<leader>fs",   builtin.lsp_document_symbols, { desc = "Document symbols" })
        vim.keymap.set("n", "gr",           builtin.lsp_references, { desc = "LSP references" })
      '';
    }
  ];
}
