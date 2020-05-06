#! /usr/bin/env bash

set -e

diff <(./nagelfar.tcl ./misctests/test.tcl) ./misctests/test.out
