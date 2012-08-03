" Vimlist syntax file
" Language:		Vimlist
" Maintainer:	Ben Crowder <ben.crowder@gmail.com>
" URL:			http://bencrowder.net/
" Version:		1
" Last Change:  2012 Aug 2
" Remark:		Uses HTML syntax file

" Read the HTML syntax to start with
if version < 600
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Don't use the standard HiLink -- it won't work with included syntax files
if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

" Some configuration
syn spell toplevel
syn case ignore
syn sync linebreaks=1


"""""""""""""""""""""""""""""""""
" Region/match definitions

" Block definition
syn region vimListBlock          start="^#.*$"  end="\r\r"  fold contains=htmlH1,vimListItem,vimListSubItem

" List items
syn match vimListItem            "^*[*]\s\+"
syn match vimListSubItem         "^\t*[*]\s\+"

" List headings (use the H1 style)
syn region htmlH1                start="^#"  end="\($\|#\+\)" contains=@Spell

" Do the highlighting
HtmlHiLink vimListItem           Identifier
HtmlHiLink vimListSubItem        VimlistSubItem

hi VimlistSubItem                ctermfg=238

hi Folded                        ctermfg=74 ctermbg=237


"""""""""""""""""""""""""""""""""
" Set the name for the syntax

let b:current_syntax = "list"

delcommand HtmlHiLink


"""""""""""""""""""""""""""""""""
" Folding
"
" Borrowed from pyfold (python.vim) and modified

setlocal foldmethod=expr
setlocal foldexpr=GetVimlistFold(v:lnum)
let g:cind = 0
let g:ctyp = 0
let g:ccmt = 0

function! GetVimlistFold(lnum)
    while 1 == 1
        " Determine the current folding level
        let line = getline(a:lnum)
        let cind = indent(a:lnum)

        " Get the next non-blank line
        let nnum = nextnonblank(a:lnum + 1)
        let nind = indent(nnum)
        let nline = getline(nnum)

        " Get the previous non-blank line
        let pnum = prevnonblank(a:lnum - 1)

        " Get the previous line indent level
        let plvlnum = a:lnum - 1
        let lvl = foldlevel(plvlnum)

        " If the previous non-blank line is the start of the file,
        " we are not in a fold
        if pnum == 0
            let retStr =  0
            break
        endif

		" If we're at the last line in the file, fold it
		if a:lnum == line("$")
			let retStr = "="
			break
		endif

        " If there are no more non-blank lines, the fold should end
        if nnum == 0
            let retStr =  0
            break
        endif

        " Blank lines always get the same fold level as the previous line
        if line =~ '^\s*$'
            let retStr =  "="
            break
        endif

        if g:ccmt == 0
            " Always create the beginning of a new fold for a new list
            if line =~ '^\s*\(#\)\s'
                let retStr =  ">" . (cind / &sw + 1)
                if g:ctyp > (cind / &sw + 1) && g:cind == cind
                    let g:ctyp = (cind / &sw + 1)
                endif
                let g:cind = cind
                let g:ctyp = g:ctyp + 1
                break
            endif

            if nind <= g:cind && g:ctyp > 0
                let retStr =  "<" . (nind / &sw + 1)
                let g:ctyp = (nind / &sw + 1)
                let g:cind = nind
                break
            endif
        endif

        let retStr =  "="
        break
    endwhile

    return retStr
endfunction


"""""""""""""""""""""""""""""""""
" Replace the look of folds
"
set foldtext=VimlistFoldText()

function! VimlistFoldText()
	let line = getline(v:foldstart)
	return line . ' (' . (v:foldend - v:foldstart) . ' items)'
endfunction
