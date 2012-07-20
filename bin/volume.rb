#!/usr/bin/ruby
# Source: https://gist.github.com/1791270
# Changed bit of code toggling mute - was throwing errors for me.
# Added output, so it could be piped to a notify-osd or somesuch if desired.


# Pulseaudio volume control
class Pulse
  attr_reader :volumes, :mutes

  # Constructor
  def initialize
    dump = `pacmd dump`.lines
    @volumes = {}
    @mutes = {}

    # Find the volume settings
    dump.each do |line|
      args = line.split

      # Volume setting
      if args[0] == "set-sink-volume" then
        @volumes[args[1]] = args[2].hex
      end

      # Mute setting
      if args[0] == "set-sink-mute" then
        @mutes[args[1]] = args[2]
      end
    end
  end

  # Adjust the volume with the given increment for every sink
  def volume_set_relative(increment)
    @volumes.keys.each do |sink|
      volume = @volumes[sink] + increment
      volume = [[0, volume].max, 0x10000].min
      @volumes[sink] = volume
      `pacmd set-sink-volume #{sink} #{"0x%x" % volume}`
    end
  end

  # Turn the music up!
  def volume_up
	puts "volume up"
    volume_set_relative 0x1000
  end

  # ... and down again
  def volume_down
	puts "volume down"
    volume_set_relative -0x1000
  end

  # Toggle the mute setting for every sink
  # Was getting errors thrown here; I don't know enough ruby to know why
  # This fixes it.
  def mute_toggle
    @mutes.keys.each do |sink|
		if @mutes[sink] == "yes"
			puts "unmuting #{sink}"
			`pacmd set-sink-mute #{sink} no`
	    else
			puts "muting #{sink}"
			`pacmd set-sink-mute #{sink} yes`
		end
    end
  end
end

# Control code
p = Pulse.new
if ARGV.first == "up" then
	p.volume_up
end
if ARGV.first == "down" then
	p.volume_down
end
if ARGV.first == "toggle" then
	p.mute_toggle
end
