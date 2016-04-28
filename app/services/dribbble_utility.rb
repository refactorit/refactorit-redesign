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

  def save_team_shots
    shots = team.shots
    ActiveRecord::Base.transaction do
      DribbbleShot.destroy_all
      shots.each do |shot|
        DribbbleShot.create!(title: shot.title, views_count: shot.views_count,
          likes_count: shot.likes_count, html_url: shot.html_url,
          image_url: shot.images['normal'], dribbble_id: shot.id,
          response_body: shot.as_json.reject!{ |k,v| k == 'token' }.to_json)
      end
    end
  end
end

