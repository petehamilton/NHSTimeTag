module TextMessageHelper
  
  def get_text_message_client_instance
    return Mediaburst::API.new('nhstimetag', 'nhstimetag')
  end
  
  def send_text_message(number, message)
    client = get_text_message_client_instance
    return client.send_message(number, message, {:from => 'NHS Time Track'})
  end
end
