---
description: Establishing a remote desktop connection to the MacBot unit
---

# 🔌 Connect

## Install MobaXTerm

{% embed url="https://download.mobatek.net/2302023012231703/MobaXterm_Installer_v23.0.zip" %}
Home Edition, Windows Installer
{% endembed %}

Use 7Zip or Windows Zip Extractor to extract the compressed folder into the Downloads/ folder

<figure><img src=".gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

Run the MobaXTerm MSI installer with the default install configuration.

<figure><img src=".gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

## MobaXTerm Session

Download the following session file to your Downloads/ folder. It contains the pre-configured environment for establishing an SSH tunnel to and streaming a graphical interface from each MacBot.

{% file src="Labs/MacBot.mxtsessions" %}

Open MobaXTerm and load the downloaded session file.

<figure><img src=".gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

<figure><img src=".gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

## Connecting to the MacBot

Ensure that you are connected to Mac-WiFi.

<figure><img src=".gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

Ensure that your MacBot is powered ON and booted by waiting 2 minutes.

Click **Connect to MacBot##**.

<figure><img src=".gitbook/assets/MicrosoftTeams-image.png" alt=""><figcaption></figcaption></figure>

Enter the password for your MacBot, which can be found here:

{% content-ref url="setup.md" %}
[setup.md](setup.md)
{% endcontent-ref %}

When prompted to save the password, always select **No**.

<figure><img src=".gitbook/assets/MicrosoftTeams-image (2).png" alt=""><figcaption></figcaption></figure>

Run neofetch to verify that you are connected to the correct machine.

{% tabs %}
{% tab title="Run NeoFetch" %}
```bash
neofetch
```
{% endtab %}

{% tab title="Install NeoFetch" %}
```
sudo apt -y install neofetch
```
{% endtab %}
{% endtabs %}

<figure><img src=".gitbook/assets/MicrosoftTeams-image(3).png" alt=""><figcaption></figcaption></figure>

Ensure that the VNC server is running on port 5902 using the following command:

```bash
vncserver -list
```

<figure><img src=".gitbook/assets/MicrosoftTeams-image(4) (1).png" alt=""><figcaption></figcaption></figure>

Connect to the MacBot by pressing the **View Desktop** button.

<figure><img src=".gitbook/assets/MicrosoftTeams-image(5).png" alt=""><figcaption></figcaption></figure>

You will be prompted for your password once more. Press **OK**.

After a few moments, you will be able to see and interact with your desktop.

<figure><img src=".gitbook/assets/MicrosoftTeams-image(6).png" alt=""><figcaption></figcaption></figure>

Click **Fullscreen** and untoggle **Always on Top**.

<figure><img src=".gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

You can now use **TAB + Windows** to toggle between your open tabs

<figure><img src=".gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>
