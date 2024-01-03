# Owen Blacker's public repo

[![Ceasefire Now](https://badge.techforpalestine.org/default)](https://techforpalestine.org/learn-more)

This is a repository of public utilities and stuff. There's not much in it yet because I haven't got round to tidying things up to be shareable.

Documentation for what there is so far is below

* **UndoVirus**

   This was a proof-of-concept I wrote in 2001, that reset a bunch of Registry keys that commonly led to email worms (at the time), then wrote a `.reg` file onto the desktop to allow a user to undo the change, then sprang a popup to tell the user what it had done.
   
   It's inactive (because I'm not that stupid); to activate it, you'd need to change the first code line to read `var HARMLESS = false;` 😉
   
* **aspnet_Membership.sql**
 
  Because I have a terrible memory, this is a SQL query to let me inspect the contents of the default ASP.Net Membership database in a useful fashion.
   
* **FindMostRecent.ps1**
 
  I needed to do some server admin stuff recently and wanted to find the most recent file in a directory tree. So, as a learning exercise as much as anything else, I wrote a [PowerShell](http://msdn.microsoft.com/en-gb/library/windows/desktop/dd835506%28v=vs.85%29.aspx) script to do it.
   
  If you find it useful and want to extend it but get into debugging problems, there are commented `Write-Host` lines in the recursion routine that might prove useful. It's also worth knowing that it will ignore any folder called `App_Data` and not recurse into it.
