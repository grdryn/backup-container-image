function component_dump_data {
    local ts=$(date '+%H:%M:%S')
    dest_file="$1/archives/dump-${ts}.rdb"
    dump_rdb_path="/var/lib/redis/data/dump.rdb"

    oc projects
    redis_pod_name=$(oc get pods -l deploymentConfig=backend-redis -o name -n 3scale | sed -e 's/^pod\///')
    cp_pod_data "3scale/${redis_pod_name}:${dump_rdb_path}" "${dest_file}"
}