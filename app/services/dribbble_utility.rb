class DribbbleUtility

  def initialize(token)
    @token = token
    @client = Dribbble::Client.new(@token)
  end

  def user
    @client.user
  end

  def team
    user.teams.first
  end
end

