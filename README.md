# clamavdocker

Minimalistic docker image for [clamav][1]

## build ( docker )

```bash
$ docker build --tag host --file Dockerfile .
$ docker run -d -t --name clamav host
$ docker cp clamav:/clamav-1.2.1/build/clamdtop/clamdtop.asm .
$ grep -rn "strchr(" clamdtop.asm
# expected results ...
clamdtop.asm:13357:        p1 = strchr(dupip, ']');
clamdtop.asm:13398:    while ((p1 = strchr(p1, ':'))) {
clamdtop.asm:13408:    while ((p1 = strchr(p1, ':'))) {
clamdtop.asm:13422:        p1  = strchr(dupip, ':');
clamdtop.asm:13541:    ipv6 = (strchr(host, ':') != NULL);
clamdtop.asm:14713:        cmde = strchr(filtered_tasks[i].line, ' ');
clamdtop.asm:14731:            const char *filstart = strchr(cmde + 1, ' ');
clamdtop.asm:15037:        const char *t = strchr(buf, ' ');
clamdtop.asm:16357:    p = pstart = vstart = strchr(conn->version, ' ');
clamdtop.asm:16511:    pstart = strchr(p, '/');
clamdtop.asm:16542:        p = strchr(pstart, '/');
clamdtop.asm:16750:        char *val = strchr(buf, ':');
clamdtop.asm:21393:            } else if (!ret || strchr(shortopts, ret)) {
```

[1]: https://github.com/Cisco-Talos/clamav
