pods=$(kubectl get po | grep  "pod1\|pod2" | awk '{print $1}' | xargs)

for i in $pods; do
service=$(echo $i | awk -F '-' '{print $2}')
if [[ "$service" == "pod1" ]]; then
echo "pod name:----   $i"
kubectl exec $i -- sh -c 'find /home/ubuntu/abhijeet -maxdepth 1 -type f'
elif [[ "$service" == "pod2" ]]; then
echo "pod name:---    $i"
kubectl exec $i -- sh -c 'find /root/tmp -maxdepth 1 -type f'
fi
done
