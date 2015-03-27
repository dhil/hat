# hat
Small concatenate (cat) clone written in Haskell.

# Compilation
 $ ghc -O2 Hat.hs -o hat

# Usage
 $ ./hat "/some/path/to/myfile1" "anotherfile" "/yet/another/file"

# Known issues
If the input contains a nonexistent file then upon processing that "file" the hat pipeline halts.
