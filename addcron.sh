crontab -r
{ crontab -l; echo "  * *   *   *   *    /bin/bash /home/latest_packet_forwarder/runall.sh
*/10 * * * *    /bin/bash /home/latest_packet_forwarder/autowireguard.sh
"; ) | crontab -