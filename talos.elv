var talos_version = v0.14.0-beta.0

# [&opt=default]
fn apply [file nodes]{
  talosctl \
      apply-config \
      --file $file \
      --insecure \
      --nodes $nodes
}

fn generate [endpoint]{
  var options = [
    # --additional-sans=worker.lan,cluster.k8s
    --dns-domain=cluster.local
    --install-disk=/dev/mmcblk0
    --install-image=ghcr.io/talos-systems/installer:$talos_version
    --kubernetes-version=1.22.4
    --output-dir=$E:HOME/.talos
    --persist=true
    --talos-version=$talos_version
    --version=v1alpha1
    --with-cluster-discovery=true
    --with-docs=false
    --with-examples=false
  ]

  talosctl gen config talos-default 'https://'$endpoint':6443' $@options # all $options
}

fn bootstrap {
  talosctl \
      # --context="talos-default" \
      # --endpoints="https://192.168.4.80:6443" \
      # --nodes="192.168.4.80" \
      # --talosconfig="$HOME/.talos/config" \
      bootstrap
}
