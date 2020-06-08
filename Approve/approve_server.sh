#!/bin/bash
peer=$(($2+1))
sudo wg set wg0 peer $1 allowed-ips 10.200.200.$peer/32