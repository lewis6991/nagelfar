#! /usr/bin/env bash

FAIL=0

test() {
    test=$1
    xfail=${2-0}
    echo -n "Running: $test: "
    out=$(diff <(./nagelfar.tcl "$test") <(grep '^\s*###' "$test" | sed 's/^\s*### \?//g'))
    if [[ $out ]]; then
        if [[ $xfail == 1 ]]; then
            echo "expected fail"
        else
            echo "failed"
            echo "$out"
            FAIL=1
        fi
    else
        echo "passed"
    fi
}

test ./misctests/ternary.tcl 1
test ./misctests/test.tcl

if [[ $FAIL == 0 ]]; then
    echo "All tests passed"
else
    echo "At least 1 test failed"
fi
