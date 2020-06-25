module ApplicationHelper
  def add_class
    if !@unread_messages.nil? && !@unread_messages.zero?
      return 'message_notice'
    else
      return ''
    end
  end
end
