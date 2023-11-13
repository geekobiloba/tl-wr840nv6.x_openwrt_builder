#   OpenWrt Builder for TP-Link TL-WR840N v6.x

Cheapie doesn't have to mean crappy.
And when no official OpenWrt build is available
for the lowly TP-Link TL-WR840N v6.x,
we can always compile it ourselves.

This repo provides only the builder for the original work:
<https://github.com/IcedShake/openwrt-19.07-tl-wr840n-v6.x>.
All credits should go to the original authors.

#   How-to

>   [!WARNING]
>   Do with your own risks!
>
>   Tested only on v6.2 router.
>
>   Wrong option can brick your router.

##  v6.2

### Easy

Simply run `make` and wait.

### Custom

1.  Run `make container`.

2.  Run `make config` to edit build config.

    Select **Exit** then **Yes** to save config.

3.  Run `make openwrt` and wait.

##  v6.1 + v6.0

1.  Run `make container`.

2.  Run `make config`.

3.  Set **Target Profile** to `TP-Link TL-WR840N v6`.

4.  Optionally, edit other config.

    Select **Exit** then **Yes** to save config.

5.  Run `make openwrt` and wait.

##  Finally

The resulting `.bin` files will be available under `bin` directory.

Flash the `*sysupgrade.bin` file to the router
using wired instead of wireless for more stable connection
and prevent bricking.

Enjoy freedom!

And when you no longer do,
revert the router to its original firmware:
<https://www.tp-link.com/us/support/download/tl-wr840n/>.

