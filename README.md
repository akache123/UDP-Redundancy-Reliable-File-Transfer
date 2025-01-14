# UDP-Redundancy-Reliable-File-Transfer

## Overview
This project extends reliable file transfer using UDP by incorporating file redundancy. The client sends a file to multiple servers simultaneously, ensuring successful transmission even under conditions of packet loss or reordering. The servers reassemble and store the file locally, providing redundancy and ensuring the correct file is transmitted.

## Features:
- **File Redundancy:** Files are replicated across multiple servers to ensure reliability.
- **Packet Loss Handling:** The application handles packet loss and reordering during transmission.
- **Configurable Parameters:** The user can set the UDP packet size, window size, and packet loss percentage.
- **Server Unavailability Handling:** The client gracefully handles server unavailability and continues transferring files to reachable servers.

## Usage:
1. **Server:**  
   `./myserver <port_number> <droppc> <root_folder_path>`
   - `<port_number>`: Port to receive packets.
   - `<droppc>`: Packet loss percentage.
   - `<root_folder_path>`: Directory where files are saved.

2. **Client:**  
   `./myclient <servn> <servaddr.conf> <mtu> <winsz> <in_file_path> <out_file_path>`
   - `<servn>`: Number of servers to replicate the file to.
   - `<servaddr.conf>`: Configuration file with server details.
   - `<mtu>`: Maximum UDP payload size.
   - `<winsz>`: Window size for packet transmission.
   - `<in_file_path>`: Input file path.
   - `<out_file_path>`: Output file path on servers.

## Test Cases:
- **Small File Transfer Without Loss**: Transfers a small file (e.g., 1KB) to multiple servers without packet loss.
- **Moderate-sized File with Loss**: Transfers a 10MB file with 10% packet loss, with retransmissions handled.
- **Large Binary File with High Loss**: Transfers a large binary file (e.g., 100MB) with 50% packet loss.
- **Server Unavailability**: Tests file transfer to multiple servers when one is unreachable.
- **Excessive Packet Loss**: Handles 90% packet loss and retransmits up to 10 times.

## Build Instructions:
1. Clone the repository.
2. Run `make` to build the executables.
3. The executables will be generated in the `bin/` directory.

## References:
- *Unix Network Programming, Volume 1: The Sockets Networking API* by Richard Stevens
- [GeeksforGeeks UDP Client-Server Example](https://www.geeksforgeeks.org/udp-server-client-implementation-c/)
- [StackOverflow UDP Socket Programming](https://stackoverflow.com/questions/35568996/socket-programming-udp-client-server-in-c)
