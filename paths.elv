use str

fn remove { |path|
  var new_path = []
  each { |x|
    if (not-eq $x $path) {
      set new_path = [$@new_path $x]
    }
  } $paths
  set E:PATH = (str:join ':' $new_path)
}

fn prepend { |path|
  if (has-value $paths $path) {
    if (not-eq $paths[0] $path) {
      remove $path
      prepend $path
    } else {
      return
    }
  } else {
    var new_path = [$path $@paths]
    set E:PATH = (str:join ':' $new_path)
  }
}

fn append { |path|
  if (has-value $paths $path) {
    if (not-eq $paths[-1] $path) {
      remove $path
      append $path
    } else {
      return
    }
  } else {
    var new_path = [$@paths $path]
    set E:PATH = (str:join ':' $new_path)
  }
}
