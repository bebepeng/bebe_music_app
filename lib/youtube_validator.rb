class YoutubeValidator
  def self.valid?(link)
    if link =~ /(https?:\/\/youtu.be\/)|(https?:\/\/www.youtube.com\/)/
      true
    else
      false
    end
  end

  def self.make_useable(link)
    if self.valid?(link)
      case
        when link =~ /(https?:\/\/www.youtube.com\/v\/)/
          link
        when link =~ /(https?:\/\/youtu.be\/)/
          "https://www.youtube.com/v/" << link.split('/')[3]
        when link =~ /(https?:\/\/www.youtube.com\/)/
          "https://www.youtube.com/v/" << link.split('/')[3].split('=')[1]
      end
    else
      ""
    end
  end
end