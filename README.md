# NetTester
FUNCTION

>  This is a penetration testing program, written in bash script for Linux, that executes and logs local network attacks. This is meant for testing local networks with SMB protocol service enabled.

> The brute-force attack will take a long time. If you just want to test if this program works, set your user as "IEUser" and password as "Passw0rd!" for the hosts in the local target network.

INITIATION: Execute NetTester.sh with bash to start the script.

    $ bash NetTester.sh

INSTALL(): The program will automatically install relevant applications.

> ![image](https://user-images.githubusercontent.com/103941010/194731596-9d3854c6-8fa0-4eaf-ba3b-fc521b79c2e5.png)

CONSOLE(): The program will arrive at a menu console for the user to choose and execute options for network testing.

> ![image](https://user-images.githubusercontent.com/103941010/194731598-7a6619ac-f2bc-4e25-8ad8-1227dd432f04.png)

NMAP_SCAN(): If you choose Option A, the program will use nmap to scan for open ports of a target address and log results.

> ![image](https://user-images.githubusercontent.com/103941010/194731621-20457ae6-f761-4387-8093-3d5cb632b078.png)


MASSCAN_SCAN(): If you choose Option B, the program will use mascan to scan for open ports of a target address and log results.

> ![image](https://user-images.githubusercontent.com/103941010/194731989-5657a561-80c8-45dd-bd10-dc3868a7d561.png)


MSF_SMBBRUTE(): The program will use MSF console to brute-force via SMB on a target address and log results.

> ![image](https://user-images.githubusercontent.com/103941010/194732227-deeec8c8-54e2-4cc0-9502-76ded15b37c2.png)


HYDRA_SMBBRUTE(): The program will use hydra to brute-force via SMB on a target address and log results.

> ![image](https://user-images.githubusercontent.com/103941010/194732267-eff8953f-177f-4722-9c9b-402ecb31c977.png)

> ![image](https://user-images.githubusercontent.com/103941010/194732273-ed6cd868-c85e-4811-8c06-72c50733c25c.png)


LOG(): Log can be found on "~/NetTester" directory as "log.log". The file logs the date, time, IPs, attack type and used arguments for NMAP_SCAN(), MASSCAN_SCAN(), MSF_SMBBRUTE(), or HYDRA_SMBBRUTE(), after their execution.

> ![image](https://user-images.githubusercontent.com/103941010/194732295-b62c98d4-5e28-4ddd-8d96-3f2842e3ab46.png)

> ![image](https://user-images.githubusercontent.com/103941010/194732285-13a2dbfb-d663-4205-8e70-467aa4e7872d.png)

