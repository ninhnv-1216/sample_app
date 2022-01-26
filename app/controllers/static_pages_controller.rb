class StaticPagesController < ApplicationController
  include Pagy::Backend

  def home
    return unless logged_in?

    @micropost = current_user.microposts.build
    @pagy, @feed_items = pagy current_user.feed.newest,
                              items: Settings.item_page
  end

  def help; end

  def contact; end

  def about; end
end
