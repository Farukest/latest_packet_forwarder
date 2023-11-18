count=$(pgrep -c lora_pkt_fwd)
echo $count
if [[ $count -gt 1 ]]; 
then
  echo "Killing that pktwds.."
  pgrep lora_pkt_fwd$i | xargs kill
fi


if [[ $count -eq 1 ]]; 
then 
	echo "ALREADY RUNNING";
else
	echo "NO LORA PACKET FORWARDER SO STARTING";			
	cd /home/latest_packet_forwarder/sx1302_hal/packet_forwarder/ && ./lora_pkt_fwd &
fi       
