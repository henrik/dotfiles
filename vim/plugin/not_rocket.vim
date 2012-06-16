" Convert Ruby 1.8 hash rockets to 1.9 JSON style hashes.
" Based on https://github.com/hashrocket/dotmatrix/commit/6c77175adc19e94594e8f2d6ec29371f5539ceeb
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+[?!]\?\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')
