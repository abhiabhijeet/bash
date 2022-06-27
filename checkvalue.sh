for i in {0..23}; do
                        size=${#i}
                        if [[ "$size" -eq 1 ]]; then
                                i=$"0$i"
                        fi
echo $i
done
