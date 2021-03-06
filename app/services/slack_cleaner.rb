class SlackCleaner
  CAPTURE = %r{\A.*<@(.*)>.*\z}
  @users = {}
  @refresh_count = 0
  def self.clean(data)
    matches = data.match(CAPTURE).try(:captures) || []
    matches.each do |match|
      data.gsub!("#{match}", "#{get_user(match)}")
    end
    data
  end

  def self.slack_client
    @client ||= Slack::Web::Client.new
  end

  def self.get_user(username)
    user = @users[username]
    if user.nil?
      refresh_user_list
      user = get_user(username)
    else
      @refresh_count = 0
    end
    user
  end

  def self.refresh_user_list
    raise 'User refresh too much' if @refresh_count > 5
    @refresh_count += 1
    slack_client.users_list(presence: true, limit: 20) do |response|
      response.members.each do |member|
        @users[member.id] = member.name
      end
    end
  end
end
