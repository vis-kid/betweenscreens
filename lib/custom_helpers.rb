module CustomHelpers

  def print_title
    '- ' + current_article.title unless current_article.nil?
  end

  def dasherize(name)
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def interviewee
    current_page.data.interviewee
  end

  def date
    current_article.date.strftime('%b %e | %Y')
  end

  def title
    current_article.title
  end

  def topic_list
    current_article.data.topic_list
  end

  def soundcloud_id
    current_page.data.soundcloud_id
  end

  def big_soundcloud_player
    "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"+ soundcloud_id.to_s + "&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
  end

   def add_link_tag(tag)
     link_to "#{tag}", tag_path(tag), :class => 'tag-list-link'
   end

end
