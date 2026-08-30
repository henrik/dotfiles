" Run commands in a herdr pane, the way Vimux did in tmux.
" CLI reference: https://herdr.dev/docs/cli-reference/

if exists("g:loaded_herdr") || &cp
  finish
endif
let g:loaded_herdr = 1

" Fraction of the split that Vim keeps when we create a runner pane. 0.65 leaves the runner 35%.
let g:herdr_split_ratio = get(g:, "herdr_split_ratio", 0.65)
let g:herdr_split_direction = get(g:, "herdr_split_direction", "right")

" The pane we most recently ran something in, so we keep reusing it.
let s:runner_pane = ""

function! s:Herdr(args) abort
  let output = system(["herdr"] + a:args)
  if v:shell_error
    throw "herdr: " . substitute(output, '\_s\+$', "", "")
  endif
  return json_decode(output)
endfunction

" A pane is idle when the shell itself is in the foreground, with nothing running in it.
function! s:IsIdle(pane_id) abort
  let info = s:Herdr(["pane", "process-info", "--pane", a:pane_id]).result.process_info
  return info.foreground_process_group_id == info.shell_pid
endfunction

function! s:Split() abort
  let response = s:Herdr([
        \ "pane", "split",
        \ "--pane", $HERDR_PANE_ID,
        \ "--direction", g:herdr_split_direction,
        \ "--ratio", string(g:herdr_split_ratio),
        \ "--cwd", getcwd(),
        \ "--no-focus",
        \ ])
  return response.result.pane.pane_id
endfunction

" Panes in this tab that we could run something in: not the one Vim is in, and not one occupied by a coding agent.
function! s:Candidates() abort
  let panes = s:Herdr(["pane", "list", "--workspace", $HERDR_WORKSPACE_ID]).result.panes
  return filter(panes, 'v:val.tab_id ==# $HERDR_TAB_ID
        \ && v:val.pane_id !=# $HERDR_PANE_ID
        \ && !has_key(v:val, "agent")')
endfunction

" Reuse a pane in this tab if we can, otherwise make one.
function! s:RunnerPane() abort
  let candidates = s:Candidates()

  " Our own runner is reused even when busy, so re-running a test interrupts the previous run instead of splitting yet another pane.
  if !empty(filter(copy(candidates), 'v:val.pane_id ==# s:runner_pane'))
    return s:runner_pane
  endif

  for pane in candidates
    if s:IsIdle(pane.pane_id)
      return pane.pane_id
    endif
  endfor

  return s:Split()
endfunction

function! HerdrRunCommand(command) abort
  if $HERDR_ENV !=# "1"
    echohl ErrorMsg | echomsg "Not running inside herdr." | echohl None
    return
  endif

  try
    let pane = s:RunnerPane()
    if !s:IsIdle(pane)
      call s:Herdr(["pane", "send-keys", pane, "ctrl+c"])
      sleep 100m
    endif

    " Clear anything half-typed at the prompt, like Vimux's reset sequence did.
    call s:Herdr(["pane", "send-keys", pane, "ctrl+u"])
    call s:Herdr(["pane", "run", pane, a:command])
    let s:runner_pane = pane
  catch /^herdr: /
    echohl ErrorMsg | echomsg v:exception | echohl None
  endtry
endfunction

function! HerdrInterruptRunner() abort
  if $HERDR_ENV !=# "1"
    echohl ErrorMsg | echomsg "Not running inside herdr." | echohl None
    return
  endif

  try
    let pane = s:runner_pane

    " Nothing run from this Vim session yet, e.g. because Vim was restarted while something kept running. Interrupt whatever is busy next door instead.
    if empty(pane)
      let busy = filter(s:Candidates(), '!s:IsIdle(v:val.pane_id)')
      if empty(busy)
        return
      endif
      let pane = busy[0].pane_id
    endif

    call s:Herdr(["pane", "send-keys", pane, "ctrl+c"])
  catch /^herdr: /
    echohl ErrorMsg | echomsg v:exception | echohl None
  endtry
endfunction

command! -nargs=1 HerdrRunCommand call HerdrRunCommand(<q-args>)
command! HerdrInterruptRunner call HerdrInterruptRunner()

" Make :TestNearest and friends run here. Registered in this file because vim-test wants a funcref, and the function has to exist by then.
let g:test#custom_strategies = get(g:, "test#custom_strategies", {})
let g:test#custom_strategies["herdr"] = function("HerdrRunCommand")
