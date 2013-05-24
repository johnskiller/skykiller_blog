Title: BT4
Date: 2005-03-09 16:20

The official BitTorrent 4.0 was out.

I have used 3.4 in my xbox linux before HD error and I dont think there're may CUI bt user. All guys i know use BitSpirit or some other fancy GUI client.

If you do want GUI, check "azureus":http://azureus.sourceforge.net/ it has everything you need and you can not beat the price: its free with source.
 
Someone also suggest "ABC":http://pingpong-abc.sourceforge.net/ and "BitTornado":http://bittornado.com
=============
The actual link is to the download is "here":http://bittorrent.com.

The changelog:

    # 2005-03-07: 4.0.0 is now available.
    Changes since the last stable release:

  # All new queue-based user interface
  # Many options are now modifiable from the interface, including upload rate
  # Lots of other interface improvements
  # Extra stats are visible, for those who like it
  # Remembers what it was doing across restarts
  # New .torrent maker "btmaketorrentgui" replaces "btcompletedir"
  # Better performance, as always
  # License has changed to the BitTorrent Open Source License
  # Torrent fields are correctly created and interpreted as utf8
  # Too many little things to list

    A few technical notes, for those interested:
  # Single port: launchmany can seed and client can download many files from a single port and thread
  # Interface now uses GTK instead of wxWidgets
  # BitTorrent packets are marked as bulk data to make traffic shaping easier