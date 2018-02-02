#!/bin/sh -x
kubectl delete pod ansible --now
kubectl delete cm ansible

sleep 2

kubectl create configmap ansible --from-file=site.yml --from-file=ansible.cfg --from-file=hosts
kubectl create -f pod.yml

sleep 4

kubectl logs ansible -f
