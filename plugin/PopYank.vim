vim9s
scripte utf-8

# PopYank.vim
# -----------
# Copyright: (c) 2025, ZAN DoYe <zandoye+vim@gmail.com>
# Licence: MIT
# Maintainer: ZAN DoYe <zandoye+vim@gmail.com>
# Last Change: 2025-03-18
#
#  This file is a part of PopYank.vim9


if exists('g:loaded_PopYank') || v:version < 900
  finish
endif
const g:loaded_PopYank = true

import autoload "impl.vim"

command -nargs=0 PopYankP call impl.Prompt()
command -nargs=? -register PopYank call impl.Reg(<q-args>)

nnoremap <silent> <Plug>(PopYank) :<C-u>call <SID>impl.Prompt()<CR>

