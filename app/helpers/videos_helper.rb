module VideosHelper

    def render_stars(value)
        output = ''
        if (1..5).include?(value.to_i)
          value.to_i.times { output += '*'}
        end
        output
      end

      def videos_count
        Video.count
    end

    def five_videos
      Video.limit(5)
    end
      
end
