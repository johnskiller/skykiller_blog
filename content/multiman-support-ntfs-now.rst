multiMan support NTFS now
#########################
:date: 2011-02-27 11:12
:author: john
:category: PS3
:tags: multiman, NTFS, ps3
:slug: multiman-support-ntfs-now

前天升级了PS3上的backup
manager，据说已经能支持NTFS了，经过一番折腾，果然可以。

升级过程很简单，在multiMan里面按R3就可以自动下载升级pkg，目前最新版本是0.16.03，下载完毕后会有提示，然后退出到XMB里安装pkg就可以了。若要支持NTFS的外接硬盘，需要编辑USB.CFG文件。通常multiMan安装在/dev\_hdd0/game/BLES80608目录下，USB.CFG位于按装目录里的USRDIR里，需要填入vendor
id, product id和volumn number。通常volumn
number是1，vid和pid可以在windows的设备管理里面看到（mac 上可以从apple
menu的系统概述-关于本机里查到）。对于不同的外接硬盘要写不同的vid和pid，有点不够方便。

搞好USB.CFG后，在multiMan里面按select+/\\（三角）按钮，就可以开启NTFS支持，屏幕下方应该出现USB
pfs driver的icon。

multiMan的配置文件里默认可以读去usb盘的GAMES和GAMEZ目录，所以只要这两个目录里的游戏都会显示出来，不过暂时还不支持中文的文件名/目录名，我就是给这个问题困惑了好久。（ps3内置硬盘里中文的目录名multiMan可以正常显示的）
