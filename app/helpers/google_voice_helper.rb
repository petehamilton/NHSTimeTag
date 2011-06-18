require 'open-uri'
module GoogleVoiceHelper
  def download_google_voice s, to_here
        writeOut = open(to_here, "wb")
        writeOut.write(open(google_voice_audio_url(s)).read)
        writeOut.close
      end
  def google_voice_audio_url(s)
    url = "http://translate.google.com/translate_tts?tl=en&q=#{CGI::escape(s)}"
    puts "Google Voice Request: #{url}"
    return url
  end
end