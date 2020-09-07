# SSHbuddy
SSH helper for storing and accessing as well copying to your ssh addresses.

Dependencies:
```
    ssh
    scp
```
You will need these to connect. Keep in mind as of this version it is specifically for accessing servers which need an identity file. 

To add a new addresss:
```
    sshbuddy -a nameofconnection hostaddress path-to-your-key
    sshbuddy --add nameofconnection hostaddress path-to-your-key
```
To connect to a saved address:
```
    sshbuddy -l nameofconnection
    sshbuddy --link nameofconnection
```
To copy to the home of address using scp:
```
    sshbuddy -c nameofconnection /path/to/file
    sshbuddy --copy nameofconnection /path/to/file
```
This is NOT a good option security wise but if you need something quick for normal use, it is good enough. Changes and pull requests welcome.
