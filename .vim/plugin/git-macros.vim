let s:gitauthorname = $GIT_COMMITTER_NAME
if s:gitauthorname == ""
    let s:gitauthorname = $NAME
    if s:gitauthorname == ""
        let s:gitauthorname = systemlist("git config user.name")[0] " remove NL
        if s:gitauthorname == ""
            let s:gitauthorname = $USER
        end
    end
end

let s:gitauthoremail = $GIT_COMMITTER_EMAIL
if s:gitauthoremail == ""
    let s:gitauthoremail = systemlist("git config user.email")[0]
    if s:gitauthoremail == ""
        let s:gitauthoremail = $EMAIL
        if s:gitauthoremail == ""
            " note: some shell do not set $HOSTNAME
            let s:gitauthoremail = $USER . "@" . systemlist("hostname")[0]
        end
    end
end

let s:gitauthorstring = printf("%s <%s>", s:gitauthorname, s:gitauthoremail)

exe "nmap ,ab  oAcked-by: "      . s:gitauthorstring . "<CR><ESC>"
exe "nmap ,rb  oReviewed-by: "   . s:gitauthorstring . "<CR><ESC>"
exe "nmap ,tb  oTested-by: "     . s:gitauthorstring . "<CR><ESC>"
exe "nmap ,sob oSigned-off-by: " . s:gitauthorstring . "<CR><ESC>"

com Ga !git add -p %
com Gad !git add %
com Gd !git diff %
com Gca !git diff --cached %

" vim: ts=4 sw=4 et
