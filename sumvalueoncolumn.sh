#! /bin/bash
echo "MetricsId,MetricsName,MetricsValue" > data.csv
while read -r line; do
	if [[ $line != *"#"* ]]; then
	metric_id=`echo $line | awk -F';' '{print $1}'`
	if [[ $metric_id =~ ^M.* ]]; then
	#	echo "metrics"
		curl 'http://******* --compressed > value.json
	metrics_value=$(cat $PWD/value.json | awk -F '"' '{print $18}')
	metrics_name=$(cat $PWD/metrics.conf | grep -w "$metric_id" | awk -F ";" '{print $2}')
	tot_sum=$(awk -F ',' -v col="$metrics_name" 'NR==1{for (i=1; i<=NF; i++) if ($i == col){c=i; break}} {printf "%0.15f\n",$c}' filename.csv | grep -v '^[A-Z]' | xargs | tr ' ' + | bc)
	echo "$metric_id,$metrics_name,$metrics_value" >> data.csv
	valu_for_tot_sum=$(printf "%.2f\n" "$tot_sum")
	valu_for_metric_sum=$(printf "%.2f\n" "$metrics_value")
	if [[ $valu_for_metric_sum == $valu_for_tot_sum ]]; then
		echo -e "\e[1;32m **********************************************************************************************no issue found for $metrics_name \e[0m"
	else
		echo -e "\e[1;31m ###############################################################################################found issue for $metrics_name \e[0m"
	fi
fi
fi
done < metrics.conf
done
