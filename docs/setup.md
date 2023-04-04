# 💾 Setup

## GitHub Repository

{% embed url="https://github.com/septmacbot/macbot-deploy" %}

## Jetson Nano Setup

1. Create an Ubuntu 18.04 image to install on the Jetson Nano [https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit)
2. Create a new user with the following credentials:
   * Username: jnano
   * Password: 9055259140
3. Rename the computer to macbot##, e.g. macbot01
4. Clone the macbot-deploy repo into the /home/jnano user directory as **\~/macbot**
5. Install ROS melodic using **\~/macnot/ros/ros\_melodic\_install.bash**
6. Install and build the full project using \~/macbot/**install.bash**
7. A ROS workspace should be created called **macbot\_ws**



## Network Setup

1. Purchase a wireless router ([https://www.newegg.ca/tp-link-archer-c50-v3/p/N82E16833704453?Item=N82E16833704453\&Description=tplink\&cm\_re=tplink-\_-33-704-453-\_-Product](https://www.newegg.ca/tp-link-archer-c50-v3/p/N82E16833704453?Item=N82E16833704453\&Description=tplink\&cm\_re=tplink-\_-33-704-453-\_-Product))
2. Ensure that each macbot has a functional USB network adapter ([https://www.newegg.ca/p/0XM-001R-00182?Description=tplink%20usb\&cm\_re=tplink\_usb-\_-9SIAFYUJ7D7418-\_-Product](https://www.newegg.ca/p/0XM-001R-00182?Description=tplink%20usb\&cm\_re=tplink\_usb-\_-9SIAFYUJ7D7418-\_-Product))
3. Plug in and set up the router in the lab area, connect it to the McMaster network using Ethernet
4. Ask IT to provide credentials to enable internet access for devices connected to the router
5. Set up static IP addresses for each macbot on the network using the following format: macbot07 = 192.168.0.107 (192.168.0.1##)
6. Using a chromium based browser (firefox causes issues), configure a virtual private server for each macbot to forward ports:
   1. router\_ip:2201 -> macbot01:22
   2. router\_ip:22## -> macbot##:22
7. Each macbot should be able to be connected to from the McMaster ethernet network using&#x20;

```bash
ssh router_ip:macbot_port -p 22##
```

8. To forward VNC, XServer, and other ports, create an SSH tunnel to the MacBot using the following bash command:

```bash
ssh -L 5902:localhost:5902 jnano@router_ip -p 22##
```

9. Automate the connection process using MobaXTerm Sessions

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

## Router Configuration File

{% embed url="https://github.com/septmacbot/macbot-deploy/raw/main/docs/Labs/TPLinkDIR822/router_configuration.bin" %}

<figure><img src=".gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

## Syncing Changes to GitHub

Run the following command with default options to generate the \~/.ssh directory:

```bash
ssh-keygen
```

Navigate to \~/.ssh and create a file called **config** with no file extension. Include the following configuration in this file.

```bash
#    MacBot SSH Profile
Host github-macbot-deploy
    HostName github.com
    User git
    IdentityFile ~/.ssh/macbot_deploy/macbot_deploy_rsa
ash
```

{% file src=".gitbook/assets/config" %}

Create the IdentityFile directory specified in the configuration script.

```
mkdir ~/.ssh/macbot_deploy
```

Generate an SSH key in this new directory, with the exact name specified in the configuration script. Both a public and private key will be created.

```
ssh-keygen
/home/jnano/.ssh/macbot_deploy/macbot_deploy_rsa
```

View the public key and add it to your GitHub Repo deploy keys.

```
gedit ~/.ssh/macbot_deploy/macbot_deploy_rsa.pub
```

<figure><img src=".gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

