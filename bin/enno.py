#!/usr/bin/env python2

import mechanize
import re

br = mechanize.Browser()

# follow does not finish with refresh enabled
br.set_handle_refresh(False)
# causes problems with refresh disabled
br.set_handle_robots(False)

br.open("http://www.ard.de/")
br.follow_link(text_regex=r"Jetzt kostenlos anmelden")
br.select_form(nr=0)
br.find_control("termsOK").items[0].selected = True
# submit needs refresh to work
br.set_handle_refresh(True)
br.submit()
