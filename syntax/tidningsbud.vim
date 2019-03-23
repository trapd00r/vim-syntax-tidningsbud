"     What: tidningsbud.vim
" Language: tidningsbud
"   Author: Magnus Woldrich <m@japh.se>
"     Date: 2019-03-23 10:14:23

if exists("b:current_syntax")
  finish
endif


syn match  tidningsbuddistriktheader / DISTRIKT /
syn match  tidningsbuddatumheader    /   DATUM    \|           /
syn match  tidningsbudtidheader      /   TID  /
syn match  tidningsbudweekdayheader /DAG/
syn match  tidningsbudnoteringheader /\v  NOTERING\s{36}/
syn match  tidningsbudbullet         /·/

syn match weekday /\vMÅ|TI|ON|TO|FR/
syn match weekend /\vLÖ|SÖ/

hi weekday ctermfg=220 cterm=none
hi weekend ctermfg=196 cterm=none


hi tidningsbuddistriktheader cterm=bold,underline,italic,reverse ctermfg=34
hi tidningsbuddatumheader    cterm=bold,underline,italic,reverse ctermfg=74
hi tidningsbudtidheader      cterm=bold,underline,italic,reverse ctermfg=166
hi tidningsbudnoteringheader cterm=bold,underline,italic,reverse ctermfg=137
hi tidningsbudweekdayheader  cterm=bold,underline,italic,reverse ctermfg=220

syn match tidningsbudcolumn /|/
hi tidningsbudcolumn cterm=bold ctermfg=240

syn match tidningsbuddistrikt /\<2[0-9][0-9][0-9]\?\>/
hi tidningsbuddistrikt  ctermfg=34

syn match tidningsbudminuter /\<[0-9][0-9][0-9] min\>/
hi tidningsbudminuter  ctermfg=166

syn match tidningsbuddatum /20[0-9][0-9]-[0-9][0-9]-[0-9][0-9]\>/
hi tidningsbuddatum        ctermfg=74


sy region dash1 matchgroup=dash1 start=/\---/ end=/\v\n/ contains=dash2 keepend
sy region dash2 matchgroup=dash2 start=/\---/ end=/\v\n/ contains=dash3 keepend
sy region dash3 matchgroup=dash3 start=/\---/ end=/\v\n/ contains=dash1 contained keepend

hi dash1 ctermfg=240
hi dash2 ctermfg=244
hi dash3 ctermfg=248


if !exists("did_tidningsbud_syntax_inits")
  let did_tidningsbud_syntax_inits = 1

  hi tidningsbudbullet ctermfg=160 cterm=bold

  hi Normal ctermfg=137

endif

let b:current_syntax="tidningsbud"
