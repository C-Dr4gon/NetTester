# NetTester
> This is a penetration testing program, written in bash script for Linux, that executes and logs local network attacks. This is meant for testing local networks with SMB protocol service enabled.

> CONFIG: The brute-force attack will take a long time. If you just want to test if this program works, set your user and password as "kali".

> 1. INITIATION: Execute NetTester.sh with bash to start the script.

    $ bash NetTester.sh

> 2. INSTALL(): The program will automatically install relevant applications.


> 3. CONSOLE(): The program will arrive at a menu console for the user to choose and execute options for network testing.


> 4.  NMAP(): The program will use nmap to scan for open ports of a target address and log results.


> 5. MASSCAN(): The program will use mascan to scan for open ports of a target address and log results.


> 6. MSF(): The program will use MSF console to brute-force via SMB on a target address and log results.


> 7. HYDRA(): The program will use hydra to brute-force via SMB on a target address and log results.


> 8. LOG(): Log can be found on "~/NetTester" directory as "log.log". The file logs the date, time, IPs, attack type and used arguments for NMAP(), MASSCAN(), MSF(), or HYDRA(), after their execution.
