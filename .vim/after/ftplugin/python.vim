" work around -python +python3 in Debian
" see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=623582
" see https://github.com/vim/vim/pull/2476
if has('python3')
	setlocal omnifunc=python3complete#Complete
endif	
