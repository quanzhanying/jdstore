module ProductsHelper
# Returns an HTML audio tag for the +source+.
# The +source+ can be full path or file that exists in
# your public audios directory.
#
#   audio_tag("sound")
#   # => <audio src="/audios/sound"></audio>
#   audio_tag("sound.wav")
#   # => <audio src="/audios/sound.wav"></audio>
#   audio_tag("sound.wav", autoplay: true, controls: true)
#   # => <audio autoplay="autoplay" controls="controls" src="/audios/sound.wav"></audio>
#   audio_tag("sound.wav", "sound.mid")
#   # => <audio><source src="/audios/sound.wav" /><source src="/audios/sound.mid" /></audio>
  def audio_tag(*sources)
    multiple_sources_tag('audio', sources)
  end
end
