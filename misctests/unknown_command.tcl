### Checking file ./misctests/unknown_command.tcl

##nagelfar syntax ::top::bar

namespace eval ::top {
    # pretend bar is defined here
    # proc bar ...
    proc foo {} {
        bar
    }
}
