class ProcessTextFileJob
  include Sidekiq::Job

  sidekiq_options retry: false

  def perform(file_id, user_id)
    text = Text.find(file_id).file.key
    path = ActiveStorage::Blob.service.path_for(text)

    File.open(path, "r") do |file|
      content = file.read

      posts = content.split(/\n\n/)

      posts.each do |entry|
        lines = entry.split(/\n/)

        title = nil
        body = nil
        tags = nil

        lines.each do |line|
          parts = line.split(':')
          key = parts[0].strip
          value = parts[1].strip

          case key
          when "Title" || "title"
            title = value
          when "Body" || "body"
            body = value
          when "Tags" || "tags"
            tags = value
          end
        end

        user = User.find(user_id)
        post = user.posts.create(title: title, body: body) if title && body
        extract_tags(tags, post) if post && tags
      end
    end
  end

  private
    def extract_tags(tags, post)
      tags.split(",").each do |tag|
        post.tags << Tag.find_or_create_by(name: tag.downcase!.strip)
      end
    end
end
