crontab -r
{ crontab -l; echo "  * *   *   *   *    /bin/bash /home/latest_packet_forwarder/runall.sh
 0 3  */1  *   *    /bin/bash /home/latest_packet_forwarder/clearlogs.sh"; } | crontab -