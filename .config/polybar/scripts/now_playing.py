#!/usr/bin/env python3

from gi.repository import Playerctl, GLib

def get_icon(status):
    icons = {
        "Playing": "",
        "Paused": ""
    }

    return icons.get(status, "")

def on_metadata(player, metadata):
    if 'xesam:artist' in metadata.keys() and 'xesam:title' in metadata.keys():
        print('{status} {artist} - {title}'.format(
            status=get_icon(player.get_property('status')),
            artist=metadata['xesam:artist'][0],
            title=metadata['xesam:title']
        ))

player = Playerctl.Player()
status= player.get_property('status')

if status:
    # initial track information
    artist = player.get_artist()
    title = player.get_title()
    print('%s %s - %s' % (get_icon(status), artist, title))
else:
    # default status
    print(' None - None')

player.connect('metadata', on_metadata)

# wait for events
main = GLib.MainLoop()
main.run()
