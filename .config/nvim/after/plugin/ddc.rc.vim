if !exists('g:loaded_ddc') | finish | endif

call ddc#custom#patch_global('sources', ['nvim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })
call ddc#enable()
