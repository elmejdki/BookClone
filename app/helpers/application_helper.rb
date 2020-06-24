module ApplicationHelper
  def add_class
    if !@dead_rooms.nil? && !@dead_rooms.zero?
      return 'message_notice'
    else
      return ''
    end
  end
end
