#!/bin/bash

# Starts services that are not already running
start_service() {
  service_name=$1
  systemctl is-active --quiet "$service_name"
  if [ $? -ne 0 ]; then
    echo "Starting $service_name..."
    sudo systemctl start "$service_name"
  else
    echo "$service_name is already running."
  fi
}

# Function to set up firewalld for libvirt
setup_firewalld() {
  echo "Setting up firewalld for libvirt..."

  # Create the libvirt zone if it doesn't exist
  sudo firewall-cmd --permanent --new-zone=libvirt

  # Add necessary services to the libvirt zone
  sudo firewall-cmd --permanent --zone=libvirt --add-service=dns
  sudo firewall-cmd --permanent --zone=libvirt --add-service=dhcp
  sudo firewall-cmd --permanent --zone=libvirt --add-service=ssh
  sudo firewall-cmd --permanent --zone=libvirt --add-service=samba
  sudo firewall-cmd --permanent --zone=libvirt --add-service=mountd
  sudo firewall-cmd --permanent --zone=libvirt --add-service=rpc-bind
  sudo firewall-cmd --permanent --zone=libvirt --add-forward-port=port=53:proto=udp:toport=53:toaddr=192.168.122.1

  # Reload firewalld to apply changes
  sudo firewall-cmd --reload

  echo "Firewalld setup complete."
}

# Start libvirt
start_service "libvirtd"

setup_firewalld

# Start the default network
echo "Checking if the default network is active..."
sudo virsh net-info default | sed -n 's/^Active: *//p'
if [ $? -ne 0 ]; then
  echo "Starting the default network..."
  sudo virsh net-start default
else
  echo "Default network is already active."
fi

echo "All virtualization services and networks are now active."
