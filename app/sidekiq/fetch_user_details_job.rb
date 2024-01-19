class FetchUserDetailsJob
  include Sidekiq::Job

  def perform
    # Do something
    response = RestClient.get('https://randomuser.me/api/?results=20')
    user_data = JSON.parse(response)['results']
    user_data.each do |data|
      user = User.find_or_initialize_by(uuid: data['login']['uuid'])
      user.assign_attributes(name:data['name'],age:data['dob']['age'],location:data['location'],gender:data['gender'])
      user.save
    end
    update_user_count(User.where('DATE(created_at) = ?', Date.today))
  end
  private
  def update_user_count(user)
    REDIS.set('male_count',user.where(gender:"male").count)
    REDIS.set('female_count',user.where(gender:"female").count)
  end

end
