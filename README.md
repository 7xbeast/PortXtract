# PortXtract
Open Ports and Services Extractor


PortXtract is a lightweight and efficient tool designed to automate the process of scanning, extracting, and displaying open ports and corresponding services from a target IP address or domain. It leverages nmap, a powerful network scanning utility, to gather information about the target's network configuration.

Key Features:

* Open Ports Extraction: Identifies and extracts open TCP ports on the target machine.
* Service Detection: Associates open ports with running services to provide useful insights for further analysis.
* Easy-to-Use Interface: With a simple command-line interface, users can input a target and get results quickly.
* Output Logging: Results can be saved to a file for documentation and further analysis.
* Customizable Scans: Flexible nmap integration allows users to modify the scan type based on their needs.


PortXtract is ideal for penetration testers, network administrators, or anyone who needs a quick overview of open ports and services running on a machine. It simplifies manual scanning and ensures that the gathered data is presented in a clean, readable format.


**Usage**


PortXtract is simple to use and requires minimal setup. To extract open ports and services from a target, follow these steps:


1.Run the Script:
Open a terminal and execute the script : ./portxtract.sh


2.Input the Target:
The tool will prompt you to enter the target IP address or domain name. 
Please enter the target IP or domain: <target_ip_or_domain>


Example Output

Open ports and services on example.com


22 ssh


80 http


443 https


Save Results to File:  The tool will save the scan results to a file named  "open_ports_services_<target_ip_or_domain>.txt"


You can review and reference this file for further analysis or documentation.

Note: Make sure you have appropriate permissions and authorization before scanning any external systems.
