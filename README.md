# docker-nat

This is a docker container for acting as a gateway and providing NAT for a VLAN segment.

The primary reason for this container was to provide NAT default gateways for some VLAN segments to OpenStack Fuel deploy on an 8-blade TranquilPC cluster, each of which have 2 network interfaces to work with.

Long story short, this solution is lighter than building VMs to service this need.

