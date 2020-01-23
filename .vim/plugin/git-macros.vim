let s:gitauthorname = $GIT_COMMITTER_NAME
if s:gitauthorname == ""
    let s:gitauthornamecmd = systemlist("git config user.name")
    if s:gitauthornamecmd != []
        let s:gitauthorname = s:gitauthornamecmd[0]
    end
    if s:gitauthorname == ""
        let s:gitauthorname = $NAME
        if s:gitauthorname == ""
            let s:gitauthorname = $USER
        end
    end
end

let s:gitauthoremail = $GIT_COMMITTER_EMAIL
if s:gitauthoremail == ""
    let s:gitauthoremailcmd = systemlist("git config user.email")
    if s:gitauthoremailcmd != []
        let s:gitauthoremail = s:gitauthoremailcmd[0]
    end
    if s:gitauthoremail == ""
        let s:gitauthoremail = $EMAIL
        if s:gitauthoremail == ""
            let s:gitauthormailhost = systemlist("cat /etc/mailname 2>/dev/null")
            if s:gitauthormailhost == []
                " note: some shell do not set $HOSTNAME
                let s:gitauthormailhost = systemlist("hostname")
            end
            if s:gitauthormailhost != []
                let s:gitauthormailhost = s:gitauthormailhost[0]
            else
                let s:gitauthormailhost = "(none)"
            end
            let s:gitauthoremail = $USER . "@" . s:gitauthormailhost
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
