# Linux for DevOps — Command Cheat Sheet

Most production servers and CI runners are Linux. These are the commands a
DevOps engineer uses daily.

---

## Process & Resource Monitoring

| Task | Command |
|------|---------|
| List processes | `ps aux` or `top` / `htop` |
| Tree of processes | `pstree` |
| Kill a process | `kill <pid>` / `kill -9 <pid>` |
| Disk usage | `df -h` |
| Folder size | `du -sh /var/log` |
| Memory | `free -h` |
| Open sockets / ports | `ss -tlnp` |
| CPU / memory per process | `ps aux --sort=-%cpu | head` |
| System logs (busybox) | `journalctl -xe` |

## Networking

| Task | Command |
|------|---------|
| Ping a host | `ping -c 4 example.com` |
| DNS lookup | `dig example.com` / `nslookup example.com` |
| Trace route | `traceroute example.com` |
| HTTP request | `curl -v https://example.com` |
| Download file | `wget -O out.txt https://example.com/a` |
| Listening ports | `netstat -tulpn` |
| Firewall (ufw) | `sudo ufw allow 22/tcp` |

## File Permissions

```bash
chmod 755 script.sh   # rwx r-x r-x
chmod 644 config.cfg  # rw- r-- r--
chmod +x script.sh    # add execute bit
chown user:group file
```

| Octal | rwx | Meaning |
|-------|-----|---------|
| 7 | rwx | read+write+execute |
| 6 | rw- | read+write |
| 5 | r-x | read+execute |
| 4 | r-- | read only |
| 0 | --- | no permission |

## Text Processing

| Task | Command |
|------|---------|
| Search files | `grep -r "error" /var/log` |
| Search with line numbers | `grep -n "foo" file` |
| Count matches | `grep -c "foo" file` |
| Stream text search | `awk '/error/ {print $1}' file` |
| Column extract | `awk '{print $2}' file` |
| Find / replace | `sed -i 's/old/new/g' file` |
| Sort unique | `sort file | uniq -c` |
| Head / tail | `head -n 20 file` / `tail -f file` |

## Finding Files

| Task | Command |
|------|---------|
| Find by name | `find / -name "*.conf"` |
| Find by size | `find / -size +100M` |
| Regex on filenames | `rg -l "TODO" src/` |

## Archive & Compression

```bash
tar -czf app.tar.gz ./app          # create gz archive
tar -xzf app.tar.gz                # extract
zip -r app.zip ./app
unzip app.zip
gzip -k file
```

## Bash Scripting Essentials

```bash
#!/usr/bin/env bash
set -euo pipefail   # fail-fast, strict
VAR="$(command)"
if [[ -f "$FILE" ]]; then ... fi
for f in ./logs/*.log; do echo "$f"; done
echo "exit was $?"
```

## Cron (scheduling)

```cron
# ┌─ minute (0-59)
# │ ┌─ hour (0-23)
# │ │ ┌─ day of month (1-31)
# │ │ │ ┌─ month (1-12)
# │ │ │ │ ┌─ day of week (0-7, Sun=0/7)
# │ │ │ │ │
0 9 * * * /opt/scripts/backup.sh     # every day at 09:00
*/15 * * * * /opt/scripts/health.sh  # every 15 minutes
```

```bash
crontab -l   # list
crontab -e   # edit
```

## Systemd Services

```bash
systemctl start  myapp.service
systemctl stop   myapp.service
systemctl status myapp.service
systemctl enable myapp.service   # start on boot
journalctl -u myapp.service -f   # follow logs
```

---

## References

- [Linux Journey](https://linuxjourney.com)
- [tldr pages](https://tldr.sh) — short man-page summaries
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)