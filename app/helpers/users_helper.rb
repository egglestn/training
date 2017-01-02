module UsersHelper
  def roles_collection
    User.roles.map do |(role_name, _role_int)|
      [t(role_name), role_name]
    end
  end
end
