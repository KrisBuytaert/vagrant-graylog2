# motd puppet module  

## Class: motd  

This class distributes a ``/etc/motd`` to alert users the server is managed by Puppet   

### Parameters:  
    None    

### Actions:  

Distributes a ``/etc/motd``  

### Requires:  
    None  

### Usage

    node default {
      include motd
    }
