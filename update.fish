function update
set commands 'sudo dnf upgrade' 'flatpak update' 'updatevim' 'fisher update' 'asdf update' 
set n (count $commands)
set len $COLUMNS
set error 0

for i in (seq 1 $n)
set title "Step $i/$n: $commands[$i]"
set half_len (math $len/2 - (string length $title)/2 - 1)
set_color -o blue
echo
printf "=%.0s" $(seq 1 $half_len)
echo -n " $title "
printf "=%.0s" $(seq 1 $half_len)
echo
set_color normal

eval $commands[$i]

if test $status != 0
set_color -o red
echo "ERROR"
set_color normal

set error (math $error + 1)
end
end
if test $error != 0
set_color -o red
echo "!! Update finished with $error errors"
set_color normal
else
set_color -o green
echo
echo
echo "Update finished with no errors!"
set_color normal
end
end
