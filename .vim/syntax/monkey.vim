" Vim Syntax File
" Language: Monkey
" Maintainer: Nicolas Gonzalez
" Latest Revision: 2024-03-11 03:34-0400

if exists('b:current_syntax')
    finish
endif

syn keyword monkeyStatement let return

let b:current_syntax = 'monkey'

hi def link monkeyStatement Statement
