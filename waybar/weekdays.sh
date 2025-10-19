days=("Ned" "Pon" "Uto" "Sri" "Čet" "Pet" "Sub")
d=$(date +%w)
echo "${days[$d]}"
