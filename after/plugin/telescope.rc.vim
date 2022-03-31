if !exists('g:loaded_telescope') | finish | endif

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')

telescope.setup{
  extensions = {
      fzf = {
        fuzzy = true,                    
        override_generic_sorter = true,  
        override_file_sorter = true,     
        case_mode = "smart_case"        
    }
  }
}
require('telescope').load_extension('fzf')
EOF


