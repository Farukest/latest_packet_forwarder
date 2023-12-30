(crontab -l; echo "  * *   *   *   *    /bin/bash /home/latest_packet_forwarder/runall.sh
 
 "; ) | crontab -