## This is a repo that deploys prometheus containers to talk to CloudEOS pods to export network metrics to scrape.

# Description

![Alt text](images/overall.jpg?raw=true "Prometheus")

This is a deployment of kubernetes that allows the ocprom container to simply talk to the Arista CloudEOS pods on localhost so that prometheus can scrape each of the kubernetes nodes which has the CloudEOS container on it and see network streaming telemetry related metrics.

### Instructions 

#### Apply the confimap for ocprometheus.  This is a configmap to feed the ocprom binary within the container.

More can be found [here](https://eos.arista.com/streaming-eos-telemetry-states-to-prometheus/) on ocprometheus and we also have this as a opensource project binary [here](https://github.com/aristanetworks/goarista/tree/master/cmd/ocprometheus)

`kubect apply -f configmap.yaml`


