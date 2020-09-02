### Checking file ./misctests/namespace_command.tcl

# Command names are always resolved by looking in the current namespace first.
# If not found there, they are searched for in every namespace on the current
# namespace's command path (which is empty by default). If not found there,
# command names are looked up in the global namespace (or, failing that, are
# processed by the appropriate namespace unknown handler.)
#
# A namespace's command path is modified through 'namespace path'

namespace eval ::a {
    proc foo {} {puts HELLO}
    namespace eval b {
        # foo is unknown because:
        # - it is not in the current namespace ::a::b
        # - it is not in the current namespace's command path (which is empty)
        # - it is not in the global namespace
        foo
    }
}

### Line  18: W Unknown command "foo"
