
# lines of code to run at IPython startup.
import sys
if sys.version_info.major == 2:
    p = "print 'IPython runnung Python ' + sys.version.split(' ', 1)[0],"
else:
    p = "print('IPython runnung Python ' + sys.version.split(' ', 1)[0], end='')"
c.TerminalIPythonApp.exec_lines = [
'import os, sys, re, json, itertools, os, math',
'from __future__ import unicode_literals, absolute_import, division',

'from datetime import datetime, timedelta',

'''
try:
    from path import path
except ImportError:
    pass
''',

'''
try:
    import requests
except ImportError:
    pass
''',
'''
try:
    import ipdb
except ImportError:
    pass
''',
"import sys;" + p,
]

# Whether to display a banner upon starting IPython.
c.TerminalIPythonApp.display_banner = False


# Enable auto setting the terminal title.
c.TerminalInteractiveShell.term_title = True

# Set to confirm when you try to exit IPython with an EOF (Control-D in Unix,
# Control-Z/Enter in Windows). By typing 'exit' or 'quit', you can force a
# direct exit without any confirmation.
c.TerminalInteractiveShell.confirm_exit = False
