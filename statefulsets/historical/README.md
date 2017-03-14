#Historical Statefulset

The yaml files `configmap, poddisruptionbudget, service and statefulset` deploy Historical as an Stateful service at Kubernetes. With this configuration Kubernetes relates each Historical instance with a concrete volume so if one Historical pod dies, Kubernetes will deploy other instance with the same volume. This means that the new deployed historical Pod will have the same files as the died pod.

## Configuration

The service configuration is 1 replicas that will deploy at one node. You can change this at `historical-statefulset.yaml` file. Historical listens at port `8083`. If you want to change the listen port you must change it at `historical-statefulset.yaml`. Historical files are stored at `/tmp`. You can change that at `historical-statefulset.yaml`.

