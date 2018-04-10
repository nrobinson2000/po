#!/usr/bin/expect -f
set timeout 10

spawn /usr/local/bin/po config

expect -exact "Branch: "
send -- "release/stable\n"
expect -exact "Branch: "
send -- "duo\n"
expect -exact "(yes/no): "
send -- "no\n"

interact
