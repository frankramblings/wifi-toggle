Download and save in `~/Library/Scripts` as `wifi-toggle.sh` (any name will work).

You need to open the script and change the `ETHERNET_REGEX` variable to match the name of your ethernet device. You can find the name of your device by running `networksetup -listnetworkserviceorder`. Your ethernet device name is the text after number in parenthesis (eg. for `(2) CalDigit TS3` use the ethernet device name `CalDigit TS3`).

Run `~/Library/Scripts/wifi-toggle.sh on` and it will install a launchd service in `~/Library/LaunchAgents`.

Now ...

If your ethernet is active, your wifi will automatically turn off
If your ethernet is inactive, your wifi will automatically turn on.
If you want to stop the automatic toggle, run `wifi-toggle.sh off`.

```
❯ wifi-toggle.sh help
Automatically toggle macOS Wi-Fi based on ethernet status (uses launchd)

Usage: wifi-toggle.sh [ on | off | help ]
   on - start automatically toggling Wi-Fi (install launchd service)
  off - stop automatically toggling Wi-Fi (uninstall launchd service)
  run - Toggle Wi-Fi status (run by launchd)
```
