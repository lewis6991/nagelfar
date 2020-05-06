### Parsing file ./misctests/test.syntax
### Checking file ./misctests/test.tcl

proc apa {} {

    set bepa 1
    # Detect missing $
    set cepa bepa
    # Detect unknown or misspelled variable
    ### Line   8: W Found constant "bepa" which is also a variable.

    set depa $cep
    ### Line  12: E Unknown variable "cep"
    set epa
    ### Line  14: E Unknown variable "epa"

    # Detect bad $
    set $depa apa
    ### Line  18: N Suspicious variable name "$depa"
    if {[info exists $cepa]} {
    ### Line  20: N Suspicious variable name "$cepa"
        # Detect wrong number of args
        set apa bepa cepa
        ### Line  23: E Wrong number of arguments (3) to "set"
        ### Line  23: W Found constant "bepa" which is also a variable.
        ### Line  23: W Found constant "cepa" which is also a variable.
    }
    # Detect ugly if
    if {$bepa == $cepa} {
        set hej 1
    } elsif {$bepa == $cepa} {
    ### Line  31: E Badly formed if statement
    ###             Found argument 'elsif' where else/elseif was expected.
        set hej 2
    } else {
        set hej 3
    }
    # Detect bad subcommand
    info gurka
    ### Line  39: E Unknown subcommand "gurka" to "info"

    # Detect bad switch comment
    switch $bepa {
        hej {
            set hej hopp
        }
        # This is bad
        hopp {
            # Detect a missing command
            miffo
        }
    }
    ### Line  47: W Switch pattern starting with #. This could be a bad comment.
    ### Line  47: W Unknown command "This"
    ### Line  47: W Unknown command "bad"
    ### Line  50: W Unknown command "miffo"
}

# Test call-by-name handling
# The syntax of this proc is described in
# the file test.syntax
proc copy {srcName dstName} {
    upvar $srcName src $dstName dst
    set dst $src
}

proc testCopy {} {
    set apa 1
    # It should not warn about apa below
    copy apa bepa
    # Bepa should be known now
    set cepa $bepa

    # Detect $ mistake
    copy apa $bepa
    ### Line  75: N Suspicious variable name "$bepa"
    copy $apa bepa
    ### Line  77: N Suspicious variable name "$apa"
}

proc bepa {} {
    # Missing quote
    set apa "hej hopp
}
# A quote just to fix syntax coloring "
### Line  83: E Could not complete statement.
###             One double quote would complete the first line
###             One double quote would complete the script body at line 84.

proc cepa {} {
    # Missing bracket
    set apa [hej hopp
}
### Line  92: E Could not complete statement.
###             One close bracket would complete the first line
###             One close bracket would complete the script body at line 93.

proc epa {} {
    # Extra close brace
    if {[string length apa}} {
        set bepa 1
    }
}
### Line  98: E Wrong number of arguments (4) to "proc"
###             Argument 4 at line 100
### Line 100: E Wrong number of arguments (1) to "if"
### Line 103: E Unbalanced close brace found

proc fepa {} {
    # Commented brace {
    if {[string length apa]} {
        set bepa 1
    }
}
}
### Line 114: E Unbalanced close brace found
###             Unbalanced brace in comment in line 110.
### Line 127: E Could not complete statement.
###             One close brace would complete the first line
###             One close brace would complete at end of line 132.
###             One close brace would complete the script body at line 136.
###             Assuming completeness for further processing.

# This should be last in the file, since
# the missing close brace disturbs anything
# after it
proc depa {} {
    # Missing close brace
    if {[string length apa] {
        set bepa 1
    }
}

### Line 129: E Wrong number of arguments (1) to "if"
### Line 132: N Close brace not aligned with line 129 (4 0)
