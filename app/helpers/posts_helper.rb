module PostsHelper
  def render_post_status(post)
    if post.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
