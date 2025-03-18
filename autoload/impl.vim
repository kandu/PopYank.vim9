vim9s
scripte utf-8

# impl.vim
# -----------
# Copyright: (c) 2025, ZAN DoYe <zandoye+vim@gmail.com>
# Licence: MIT
# Maintainer: ZAN DoYe <zandoye+vim@gmail.com>
# Last Change: 2025-03-18
#
#  This file is a part of PopYank.vim9


def Yank(content: list<string>, reg: string)
  setreg(reg, content, 'l')
  redraw
  if len(reg) > 0
    echo 'PopYank to register @' .. reg
  else
    echo 'PopYank to register @"'
  endif
enddef

export def Reg(reg: string)
  const popups = popup_list()
  if len(popups) > 0
    const bufId = winbufnr(popups[0])
    const content = getbufline(bufId, 1, '$')
    Yank(content, reg)
  else
    echo "No popup window exists"
  endif
enddef

export def Prompt()
  const popups = popup_list()
  if len(popups) > 0
    const bufId = winbufnr(popups[0])
    const content = getbufline(bufId, 1, '$')
    echo "register: "
    const reg = nr2char(getchar())
    if reg == "\<Cr>"
      Yank(content, "")
    else
      Yank(content, reg)
    endif
  else
    echo "No popup window exists"
  endif
enddef

