require 'net/http'
require 'json'

module ElevatorMedia
    class Streamer
        @array_size = 50 #maximum is 50

        def self.getContent
            # content = self.pickVideoFromList
            content = self.wrapIFrame(self.pickVideoFromList)
            return "<div>"+content+"</div>"
        end

        # def self.testingRspec
        #     return "hello world"
        # end

        private #private methods

        # def self.testPrivateMethod(input)
        #     return input
        # end

        def self.wrapIFrame(id)
            # iframe_string = "<iframe src="
            # iframe_string.concat(input)
            # iframe_string.concat(">")
            # iframe_string.concat("</iframe>")
            # return iframe_string
            return "<iframe src='https://www.youtube.com/embed/#{id}'></iframe>"
        end

        def self.getYtVideoList
            # array_size = 50 #maximum is 50
            search = "cat"
            key = ENV['GOOGLE_KEY']
            # request = "https://www.googleapis.com/youtube/v3/search?key=#{key}&maxResults=#{array_size}&part=snippet&type=video&q=#{search}"
            uri = URI("https://www.googleapis.com/youtube/v3/search?key=#{key}&maxResults=#{@array_size}&part=snippet&type=video&q=#{search}")
            response = Net::HTTP.get_response(uri)
            return response.body
        end

        def self.pickVideoFromList
            list_of_videos = JSON.parse(self.getYtVideoList)
            rng = rand(@array_size)
            return list_of_videos["items"][rng]["id"]["videoId"]
        end

    end
end
