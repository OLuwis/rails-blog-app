class PostsJob
  include Sidekiq::Job

  sidekiq_options retry: false

  def perform(file_url, user_id)
    response = HTTP.follow.get(file_url.sub(/localhost|127.0.0.1/, ENV["CONTAINER_NAME"] || "localhost"))

    posts = response.to_s.split(/\r\n\r\n/)

    posts.each do |entry|
      lines = entry.split(/\r\n/)

      title = nil
      body = nil
      tags = nil

      lines.each do |line|
        parts = line.split(':')
        key = parts[0].strip
        value = parts[1].strip

        case key
          when /(t|T)itle/
            title = value
          when /(b|B)ody/
            body = value
          when /(t|T)ags/
            tags = value
        end
      end

      user = User.find(user_id)
      post = user.posts.create(title: title, body: body) if title && body
      extract_tags(tags, post) if post && tags
    end
  end

  private
    def extract_tags(tags, post)
      tags.split(/, |,/).each do |tag|
        post.tags << Tag.find_or_create_by(name: tag.strip)
      end
    end

end
