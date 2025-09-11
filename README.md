# Active Directory-Hospital HomeLab

I'm going to build a homelab to run an Active Directory using Oracle VirtualBox. So I'm going to document the step by step how I built the Active Directory on VM HomeLab.

1. Download Oracle VirtualBox for virtual machine and download it to your machine and select for operating system to create a virtual machine.

https://www.virtualbox.org/wiki/Downloads

2. Download Windows Server and Windows 10 ISO files for both server and client machines.

https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019
https://www.microsoft.com/en-us/software-download/windows10

3. Create a virtual machine using Windows 10 as boot media and naming it "HospitalDC".

<img width="2319" height="1414" alt="HospitalDC VM info" src="https://github.com/user-attachments/assets/abb35373-be57-48ae-8de8-2ded14eae56a" />

<img width="2310" height="1449" alt="HospitalDC VM info2" src="https://github.com/user-attachments/assets/81d5b34c-d9a6-4d8d-bfcc-75b4aea16e2c" />

<img width="2309" height="1426" alt="HospitalDC VM system info" src="https://github.com/user-attachments/assets/b01cf5ed-e86d-4dde-a9cf-f0e4a79ca578" />


4. Configure the network settings on the virtual machine with two network adapters: one for external internet network and one for private network.

   A. Network Adapter 1: NAT [External Internet Network]
  <img width="2292" height="1418" alt="HospitalDC VM Network Port1" src="https://github.com/user-attachments/assets/b1f4e2fe-e2a6-4e6f-97a5-f48a927dc949" />

   B. Network Adapter 2: Intnet [Private Network]
  <img width="2300" height="1410" alt="HospitalDC VM Network Port2" src="https://github.com/user-attachments/assets/9e894cdb-945a-4e66-92b9-01a131ebafd2" />

5. Install Windows Server 2019 on the virtual machine. Once the Windows Server is installed in virtual machine and logged in as Admin.

<img width="1280" height="720" alt="HospitalDC Administrator Login Page" src="https://github.com/user-attachments/assets/8a80aa7e-9c65-43aa-9118-861ca5bff04d" />

6. Install Guest Addition in VirtualBox VM for enhanced user experience.

<img width="1024" height="768" alt="HospitalDomainControl VirtualBox Guest Additions installed" src="https://github.com/user-attachments/assets/ab0a200e-9e78-493e-83df-444a143a44c7" />

7.  Rename the adapters Ethernet to INTERNET and Ethernet2 to Internal and configure the IP addresses prior to installing DNS server.

<img width="972" height="588" alt="HospitalDC Configuration of Network Adapters" src="https://github.com/user-attachments/assets/bb641c84-e922-4050-a25d-4716971baad4" />

Assign IP Address to Internal Network Connection that will be used for DNS server configuration

<img width="1092" height="824" alt="HospitalDC Internal Network Connection detail" src="https://github.com/user-attachments/assets/9c1eb522-3c85-4361-9d32-fc287ccb68f3" />

IP Address for Internet Network Connection:
<img width="1092" height="824" alt="HospitalDC Internet Connection detail" src="https://github.com/user-attachments/assets/0ea57539-7be6-4741-b122-784243f7712c" />

8. Install Active Directory Domain Services to create the domain and name the domain

<img width="1092" height="824" alt="HospitalDC Active Directory installation" src="https://github.com/user-attachments/assets/9710b2dd-84a8-46cd-b367-a2e70bd10238" />
<img width="1092" height="824" alt="HospitalDC domain name" src="https://github.com/user-attachments/assets/6e298a97-620c-4224-b513-3af2dc4ad85a" />
<img width="1092" height="824" alt="HospitalDC BIOS domain name" src="https://github.com/user-attachments/assets/18efeaab-9e91-49aa-aa95-f2218333b3a5" />

9. Once the Active Directory Domain Services is installed and domain is created, the VM is rebooted. After the reboot, sign in with domain admin username and password.
<img width="1280" height="720" alt="HospitalDC BMCHospital Administrator Login Page" src="https://github.com/user-attachments/assets/5c87904e-b616-498a-a96c-d73ccf096a1e" />

10. Create an organizational unit to store domain admin account. Create the domain admin. Signout and login with new domain admin account.
<img width="1280" height="720" alt="HospitalDC Domain Admin account" src="https://github.com/user-attachments/assets/bb735960-a5f1-4954-b11a-d6ee5371eb87" />

11. Configure remote access and routing for client computer so that private network can access the internet through domain controller.
<img width="1280" height="720" alt="HospitalDC Installation of Remote Access RAS" src="https://github.com/user-attachments/assets/475f5db6-fc39-4be8-956e-322148153f8f" />
<img width="1280" height="720" alt="HospitalDC Installation of Remote Access RAS 2" src="https://github.com/user-attachments/assets/db4abf5e-8abe-459c-b226-575eca12bb47" />

12. Setup DHCP Server on domain controller.

<img width="1280" height="724" alt="HospitalDC Installation of DHCP" src="https://github.com/user-attachments/assets/fad91324-015d-41e7-8677-e224a59fa68b" />
<img width="980" height="724" alt="HospitalDC DHCP Scope" src="https://github.com/user-attachments/assets/8dd8d02f-b264-47ff-8bc9-7ee59cc4b860" />
<img width="980" height="724" alt="HospitalDC DHCP IP Address Range" src="https://github.com/user-attachments/assets/bed2e7ed-5e0d-4435-a1d8-4b63fad5e2b5" />

13. Create Active Directory user scripts on Windows PowerShell as an Administrator.

<img width="972" height="672" alt="HospitalDC Active Directory OU" src="https://github.com/user-attachments/assets/0c3fdc74-db4b-4882-b22f-8ffe452f568c" />
<img width="972" height="648" alt="HospitalDC Active Directory users identiy" src="https://github.com/user-attachments/assets/2eead5c0-e77c-4538-9acb-87fb713813b1" />
<img width="972" height="672" alt="HospitalDC Active Directory Users and Computers" src="https://github.com/user-attachments/assets/54abf076-3374-4c3a-afca-d10f74b5932a" />

14. Create Windows 10 Virtual Machine and name it "HospitalCLIENT1".

<img width="1024" height="768" alt="HospitalCLIENT1 Windows Client Setup" src="https://github.com/user-attachments/assets/75caaba5-cec8-41f2-82b9-dcb3254fd1f6" />

Once the Windows 10 VM is setup, run the command ipconfig on command prompt to confirm the IP address and run the command ipconfig/all to see the detailed information on the domain ranging from network adapters, DNS server, DHCP server, IP address and MAC address.

<img width="1024" height="768" alt="HospitalCLIENT1 Login Page" src="https://github.com/user-attachments/assets/4c8e8fd7-349d-49f8-a4cc-8c31e2289754" />
<img width="1024" height="768" alt="HospitalCLIENT1 IPCONFIG" src="https://github.com/user-attachments/assets/7c46c347-add8-402a-bd8c-f1e8a330ccb1" />
<img width="1024" height="768" alt="HospitalCLIENT1 IPCONFIG ALL" src="https://github.com/user-attachments/assets/803a63b6-696b-4d37-a8de-572ea6c60df0" />

Run the command whoami to make sure everything is running successfully and verify the domain membership and authenticate my username a-shaikh. 
<img width="1024" height="768" alt="HospitalCLIENT1 whoami command after joining domain" src="https://github.com/user-attachments/assets/6d5b80af-b921-4b44-b9ac-62cb65cfeaa5" />








