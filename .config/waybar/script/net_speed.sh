#!/bin/bash
interface=$(ip route | grep '^default' | awk '{print $5}')
rx=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx=$(cat /sys/class/net/$interface/statistics/tx_bytes)
sleep 1
rx_new=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_new=$(cat /sys/class/net/$interface/statistics/tx_bytes)
echo " $(numfmt --to=iec $(($rx_new - $rx)))  $(numfmt --to=iec $(($tx_new - $tx)))"
