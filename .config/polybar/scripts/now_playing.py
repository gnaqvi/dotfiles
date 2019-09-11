#!/usr/bin/env python3

from gi.repository import Playerctl, GLib

player = Playerctl.Player()

def on_metadata(player, metadata):
    if 'xesam:artist' in metadata.keys() and 'xesam:title' in metadata.keys():
        print(' {artist} - {title}'.format(
            artist=metadata['xesam:artist'][0],
            title=metadata['xesam:title'])
        )

def on_play(player, status):
    print(' {artist} - {title}'.format(artist=player.get_artist(), title=player.get_title()))

def on_pause(player, status):
    print(' {artist} - {title}'.format(artist=player.get_artist(), title=player.get_title()))

player.connect('playback-status::playing', on_play)
player.connect('playback-status::paused', on_pause)
player.connect('metadata', on_metadata)

main = GLib.MainLoop()
main.run()
