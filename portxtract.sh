#!/bin/bash

# PortXtract - Open Ports and Services Extractor
# Developed by Anoop P D

# Display first ASCII art in high-intensity blue
echo -e "\e[94m
                                                                      -#@@%*-                     
                                                                      @@@@@@@@@@*                   
                                                                    .@@@@@@@@@@@@%                  
                   #@@@@%                                           @@@@@@@@@@@@@@=                 
                 :@@@@@@@@-                                         @@@@@@@@@@@@@@=                 
                 +@@@@@@@@%                                         +@@@@@@@@@@@@@.                 
                 :@@@@@@@@-                                          @@@@@@@@@@@%.                  
                   #@@@@@@                   :+-                  .%@+ :%@@@@@#                     
                         *@+               %@@@@@%              :%@-                                
                           %@.            @@@@@@@@%           :%@:                                  
                            =@*           @@@@@@@@%         :%@.                                    
                              %@.          %@@@@@#        -%%:                                      
                               -@%           @#:        +@#.                                        
                                 %@=        :@:       +@#                                           
                                  -@@       @#      =@#                                             
                                    %@%-@@@@@@@=  *@#                                               
                                     @@%       @@@#                                                 
                                    @@          .@#                                                 
                                   *@-           .@.                                                
                      ..           @@             @:                                                
                   .%@@@@% .-=+#@@@@@*           :@.                                                
                   *@@@@@@@#=..     *@=         =@@=                                                
                   +@@@@@@=          .@@+.   .+@#. +@%-                                             
                    .#@@*.             #@#*#*+-      .#@%:   *@@@@@@@=                              
                                      .@+               :*@@@@@@@@@@@@@-                            
                                      @#                  *@@@@@@@@@@@@@-                           
                                     @%                  .%@@@@@@@@@@@@@%                           
                                    %@-                   %@@@@@@@@@@@@@#                           
                               -%@@@@@                    +@@@@@@@@@@@@%                            
                              %@@@@@@@@*                   .%@@@@@@@@@%                             
                             #@@@@@@@@@@                      -%@@@*                                
                             #@@@@@@@@@%                                                           
                              %@@@@@@@@-                                                           
                                +%@@#-                       \e[0m"
                                
echo ""

# Display second ASCII art in white
echo -e "\e[97m
██████╗  ██████╗ ██████╗ ████████╗██╗  ██╗████████╗██████╗  █████╗  ██████╗████████╗
██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
██████╔╝██║   ██║██████╔╝   ██║    ╚███╔╝    ██║   ██████╔╝███████║██║        ██║   
██╔═══╝ ██║   ██║██╔══██╗   ██║    ██╔██╗    ██║   ██╔══██╗██╔══██║██║        ██║   
██║     ╚██████╔╝██║  ██║   ██║   ██╔╝ ██╗   ██║   ██║  ██║██║  ██║╚██████╗   ██║   
╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   
\e[0m"

# Display the developer information, name, and description in red
echo -e "\e[31m------------------------------------------------------------------"
echo "PortXtract - Open Ports and Services Extractor"
echo "Developed by Anoop P D"
echo "GitHub: 7xbeast"
echo "PortXtract is a lightweight and efficient tool designed to automate the process of scanning, extracting, and displaying open ports and corresponding services from a target IP address or domain. It leverages nmap, a powerful network scanning utility, to gather information about the target's network configuration."
echo "------------------------------------------------------------------"

# Prompt the user for the target IP or domain in white
echo -e "\e[97m"
read -p "Please enter the target IP or domain: " TARGET
echo -e "\e[0m"  # Reset to default color after input prompt

# Check if the user provided an input
if [ -z "$TARGET" ]; then
    echo "Error: No target IP or domain provided. Exiting..."
    exit 1
fi

# Run the nmap scan to find open ports and services
echo "[*] Running nmap scan on $TARGET..."
nmap_output=$(nmap -Pn -open $TARGET)

# Check if the nmap scan was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to run nmap scan. Please check the target and try again."
    exit 1
fi

# Extract open ports and services from the nmap output
echo "[*] Extracting open ports and services..."
open_ports_services=$(echo "$nmap_output" | grep -E "^[0-9]+/tcp.*open" | awk '{print $1, $3}')

# Check if any open ports were found
if [ -z "$open_ports_services" ]; then
    echo "No open ports found on $TARGET."
    exit 0
fi

# Display the open ports and services in a clean format
echo "Open ports and services on $TARGET:"
echo "------------------------------------"
echo "$open_ports_services" | sed 's/\/tcp//'  # Removing /tcp from the output

# Optionally, save the result to a file
echo "$open_ports_services" | sed 's/\/tcp//' > open_ports_services_$TARGET.txt
echo "[*] Open ports and services saved to open_ports_services_$TARGET.txt"
