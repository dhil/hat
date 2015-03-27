# Haskell conATenate
Small concatenate (cat) clone written in Haskell.

# Compilation
<pre>$ ghc -O2 Hat.hs -o hat</pre>

# Usage
<pre>$ ./hat "/some/path/to/myfile1" "anotherfile" "/yet/another/file"</pre>

# Known issues
If the input contains a nonexistent file then upon processing that "file" the hat pipeline halts.
