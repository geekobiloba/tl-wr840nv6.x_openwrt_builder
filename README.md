#   OpenWrt Builder for TP-Link TL-WR840N v6.x

Cheapie doesn't have to mean crappy.
And when no official OpenWrt build is available
for the lowly TP-Link TL-WR840N v6.x,
we can always compile it ourselves.

This repo provides only the builder for the original work:
<https://github.com/IcedShake/openwrt-19.07-tl-wr840n-v6.x>.
All credits should go to the original authors.

#   How to

Tested only with v6.2 model.
But it provides options for v6.0 and v6.1 models, too.
Read the original work when in doubt.

>   [!WARNING]
>   **Do with your own risks!**
>
>   Wrong option can brick your router.

1.  Build the `Dockerfile`,
    create a container from the resulting image,
    enter the container,
    and go into `~/openwrt-19.07-tl-wr840n-v6.x/`.

2.  Run this line to fetch and set all build packages,

    ```shell
    ./scripts/feeds update -a && ./scripts/feeds install -a
    ```

3.  Optionally, run `make menuconfig` to edit build config.

    >   [!IMPORTANT]
    >   Absolutely needed when you're building for v6.0 or v6.1 model!

4.  Run `make defconfig` if you don't take step 3.

5.  Run `make` to compile OpenWrt.

    The resulting `.bin` files will be available under
    `~/openwrt-19.07-tl-wr840n-v6.x/bin/targets/ramips/mt76x8/`

    >   [!IMPORTANT]
    >   Always run `make clean` before running another build!

6.  Flash the `*sysupgrade.bin` file into the router.

    Enjoy freedom!

    And when you don't,
    the router can (possibly) be reverted to its original firmware:
    <https://www.tp-link.com/us/support/download/tl-wr840n/>.

