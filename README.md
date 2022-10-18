# NetTester

![image](https://user-images.githubusercontent.com/103941010/194732404-9ffbab20-3cd3-458f-9802-ae5bc4347c61.png)

This is a penetration testing program, written in shell script, that executes and logs local network attacks. This is meant for testing local networks with SMB protocol service enabled.

The brute-force attack will take a long time. If you just want to test if this program works, set your user as "IEUser" and password as "Passw0rd!" for the hosts in the local target network.

## MODULES

INSTALL(): automatically installs relevant applications and creates relevant directories

CONSOLE(): collects user input to choose and execute option for network testing

NMAP_SCAN(): uses nmap to scan for open ports of a target address and execute LOG() 

MASSCAN_SCAN(): uses mascan to scan for open ports of a target address and execute LOG()

MSF_SMBBRUTE(): uses MSF console to brute-force via SMB on a target address and execute LOG()

HYDRA_SMBBRUTE(): uses hydra to brute-force via SMB on a target address and execute LOG()

LOG(): saves log reports with date, time, IPs, attack type and used arguments for NMAP(), MASSCAN(), MSF(), or HYDRA()

## EXECUTION

Execute NetTester.sh with bash to start the script.

    $ bash NetTester.sh

## INSTALL()

The user will be asked to either install relevant applications or skip to the console. if applications are already installed previously.

![image](https://user-images.githubusercontent.com/103941010/194731596-9d3854c6-8fa0-4eaf-ba3b-fc521b79c2e5.png)

## CONSOLE()

After installation or skipping installation, the user will arrive at a menu console for the user to choose and execute options for network testing. 

After the execution of any test, the user will return to the console.

![image](https://user-images.githubusercontent.com/103941010/194731598-7a6619ac-f2bc-4e25-8ad8-1227dd432f04.png)

## NMAP_SCAN()

If the user chooses Option A, the script will use nmap to scan for open ports of a target address and log results.

![image](https://user-images.githubusercontent.com/103941010/194731621-20457ae6-f761-4387-8093-3d5cb632b078.png)


## MASSCAN_SCAN()

If user chooses Option B, the script will use mascan to scan for open ports of a target address and log results.

![image](https://user-images.githubusercontent.com/103941010/194731989-5657a561-80c8-45dd-bd10-dc3868a7d561.png)


## MSF_SMBBRUTE()

If user chooses Option C, the script will use MSF console to brute-force via SMB on a target address and log results.

![image](https://user-images.githubusercontent.com/103941010/194732227-deeec8c8-54e2-4cc0-9502-76ded15b37c2.png)


## HYDRA_SMBBRUTE()

The program will use hydra to brute-force via SMB on a target address and log results.

![image](https://user-images.githubusercontent.com/103941010/194732267-eff8953f-177f-4722-9c9b-402ecb31c977.png)

![image](https://user-images.githubusercontent.com/103941010/194732273-ed6cd868-c85e-4811-8c06-72c50733c25c.png)


## LOG()

The log file can be found in the "~/NetTester" directory as "log.log". The file contains the date, time, IPs, attack type and used arguments for NMAP_SCAN(), MASSCAN_SCAN(), MSF_SMBBRUTE(), or HYDRA_SMBBRUTE(), after their execution.

![image](https://user-images.githubusercontent.com/103941010/194732295-b62c98d4-5e28-4ddd-8d96-3f2842e3ab46.png)

![image](https://user-images.githubusercontent.com/103941010/194732285-13a2dbfb-d663-4205-8e70-467aa4e7872d.png)

