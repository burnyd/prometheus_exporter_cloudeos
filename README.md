## This is a repo that deploys prometheus containers to talk to CloudEOS pods to export network metrics to scrape.

# Description

![Alt text](files/overall.jpg?raw=true "Prometheus")

This is a deployment of kubernetes that allows the ocprom container to simply talk to the Arista CloudEOS pods on localhost so that prometheus can scrape each of the kubernetes nodes which has the CloudEOS container on it and see network streaming telemetry related metrics.

### Instructions 

#### Apply the confimap for ocprometheus.  This is a configmap to feed the ocprom binary within the container.

More can be found [here](https://eos.arista.com/streaming-eos-telemetry-states-to-prometheus/) on ocprometheus and we also have this as a opensource project binary [here](https://github.com/aristanetworks/goarista/tree/master/cmd/ocprometheus)

`kubect apply -f configmap.yaml`

#### An example of how prometheus should be configured is within the prometheus.yaml file.

 `- job_name: 'cloudeos-metrics'`
    `static_configs:`
      `- targets: ['k8smaster:30988', 'node1:30988', 'node2:30988']`

#### Here is a taget example of BGP Config metrics

> root@k8smaster:~ kubectl get nodes -o wide
> NAME        STATUS   ROLES    AGE     VERSION   INTERNAL-IP     
> k8smaster   Ready    master   6d23h   v1.18.2   10.90.224.161   
> node1       Ready    <none>   6d23h   v1.18.2   10.90.224.162   
> node2       Ready    <none>   6d23h   v1.18.2   10.90.224.163 
>
>
> curl 10.90.224.161:30988/metrics
> BgpPfxInstalled2{neighbor="10.50.0.1"} 44
> BgpPfxInstalled2{neighbor="10.60.0.1"} 43
> BgpPfxReceived2{neighbor="10.50.0.1"} 44
> BgpPfxReceived2{neighbor="10.60.0.1"} 43

