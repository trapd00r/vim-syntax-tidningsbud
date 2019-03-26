"     What: tidningsbud.vim
" Language: tidningsbud
"   Author: Magnus Woldrich <m@japh.se>
"     Date: 2019-03-26 14:26:43

if exists("b:current_syntax")
  finish
endif


syn match  tidningsbuddistriktheader / DISTRIKT /
syn match  tidningsbuddatumheader    /   DATUM    /
syn match  tidningsbudtidheader      /   TID  /
syn match  tidningsbudweekdayheader /DAG/
syn match  tidningsbudnoteringheader /\v  NOTERING\s{36}/
syn match  tidningsbudplaneradeheader /\v\s{30}PLANERADE\s{40}/
syn match  tidningsbudbullet         /·/


syn match tidningsbudhr /\v[=]{80}/
hi tidningsbudhr ctermfg=196 cterm=bolditalicunderline


syn match weekday /\v^(MÅ|TI|ON|TO|FR)\s+/
syn match weekend /\v^(LÖ|SÖ)\s+/


hi weekday ctermfg=220 cterm=none
hi weekend ctermfg=196 cterm=none

syn match  tidningsbudtotal /TOTALUTDELNING/
hi tidningsbudtotal ctermfg=197 ctermbg=53 cterm=boldunderlinereverse

hi tidningsbuddistriktheader cterm=bold,underline,italic,reverse ctermfg=34
hi tidningsbuddatumheader    cterm=bold,underline,italic,reverse ctermfg=74
hi tidningsbudtidheader      cterm=bold,underline,italic,reverse ctermfg=166
hi tidningsbudnoteringheader cterm=bold,underline,italic,reverse ctermfg=137
hi tidningsbudweekdayheader  cterm=bold,underline,italic,reverse ctermfg=220
hi tidningsbudplaneradeheader cterm=bold,underline,italic        ctermfg=143 ctermbg=232 cterm=reverse

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

"exe 'syn match tidningsbudtoday /\v.*' . strftime("%Y-%m-%d") . '.*/'
"hi tidningsbudtoday cterm=underline

let b:current_syntax="tidningsbud"
