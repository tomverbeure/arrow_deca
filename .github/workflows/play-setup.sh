#!/usr/bin/expect

set installer [lindex $argv 0]
set installmode [lindex $argv 1]
set installdir [lindex $argv 2]
set timeout 600
set yesno "\\\[\[Yy\]/\[Nn\]\\\]*:"

spawn $installer --mode $installmode --installdir $installdir --accept_eula 1

expect {
  "Do you want to continue to install the software*" { send "y\r"; exp_continue }
  "Press \\\[Enter\\\] to continue*" { send "\r"; exp_continue }
  "Do you accept this license? $::yesno" { send "y\r"; exp_continue }
  "Installation directory \\\[*\\\]" { send "\r"; exp_continue }
  "Quartus * (Free)  $::yesno" { send "y\r"; exp_continue }
  "Quartus * (Free) *64-bit support* $::yesno" { send "y\r"; exp_continue }
  "Quartus * (Free)  - Quartus Prime Help" { send "n\r"; exp_continue }
  "Quartus * (Free)  - Devices *$::yesno" { send "y\r"; exp_continue }
  "ModelSim - Intel FPGA Starter Edition (Free)" { send "n\r"; exp_continue }
  "ModelSim - Intel FPGA Edition" { send "n\r"; exp_continue }
  "Is the selection above correct? $::yesno" { send "y\r"; exp_continue }
  "Create shortcuts on Desktop $::yesno" { send "n\r"; exp_continue }
  "Launch Quartus * $::yesno" { send "n\r"; exp_continue }
  "Provide your feedback * $::yesno" { send "n\r"; exp_continue }
  eof { }
}
