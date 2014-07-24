kanso-ace
===================

ace wrapped for kan.so

This is currently version 2014.07.09.  The ace website is:

http://ace.c9.io/

Usage
-----

More information concerning the API for ace is found on the above webpage.  Ace
comes with a very large number of extensions.  To accomodate all these
possibilities without unnecessarily bloating the design document, ace may be
configured from your head kanso.json file: 

```
{
  ...
  "ace" : {
    "ext" : ["linking"], 
    "mode" : ["python", "javascript"], 
    "theme" : ["github"], 
    "worker" : ["php"], 
  }
  ...
}
```

This will add the following attachments to your design document:

```
  ace/ext-linking.js
  ace/mode-python.js
  ace/mode-javascript.js
  ace/theme-github.js
  ace/worker-php.js
```

Note, these are all optional so can be left off if not needed/wanted.
