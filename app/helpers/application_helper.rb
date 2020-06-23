module ApplicationHelper
  def add_class
    unless @dead_rooms.zero?
      return 'message_notice'
    else
      return ''
    end
  end
end
